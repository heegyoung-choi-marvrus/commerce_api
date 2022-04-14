# Commerce Api with FastApi

## Overview
FastApi 를 사용해 api 서버를 구축합니다. 아래 가이드를 참고하세요.

## Delvelopment environment
* Language: Python3.10
* OS: Utuntu20.04
* WSGI/ASGI: uvicorn
* DB: Mysql8 

모든 필요한 디펜던시는 Dockerfile 을 통해 설치됩니다.  
__만약 사용하는 PC 가 M1 칩이 탑재되지 않은 맥북이라면 docker-compose-local-db.yml 파일에 "platform: linux/amd64" 해당 부분은 지우고 실행해주세요.__  
(M1 탑재된 맥북의 경우 mysql8 버전에 한해 "No Matching Manifest For Linux/Arm64/V8 Docker MySql" 이슈가 아직 해결되지 않아 "platform: linux/amd64" 해당 설정이 필요.)

### 1. 소스코드 다운받기
코드를 클론한다.

### 2. 소스코드 위치 수정하기
도커로 웹 서버를 띄우기 전 마운트될 소스코드 위치를 수정한다.
"~/PycharmProjects/commerce_api" 이 부분을 본인 소스코드 로컬 Path 로 변경한다.
<img width="937" alt="Screen Shot 2022-04-12 at 12 32 06 AM" src="https://user-images.githubusercontent.com/103478627/162883513-4ffc8621-c15f-4787-a999-e4393ee05d92.png">

### 3. 도커로 웹서버 띄우기
이후 터미널을 통해 commerce_api 폴더까지 이동한다.
그리고 아래 쉘 스크립트를 실행한다.
```bash
chmod +x ./setup.sh
./setup.sh 혹은 sh setup.sh
```

### 4. DB 서버 띄우기
```bash
docker-compose -f docker-compose-local-db.yml up
```
Datagrip 으로 DB를 연결해 마이그레이션 이후 데이터를 조회할 수 있다. (아래 그림 참고)

도커 웹 서버에서, 아래와 같이 _dig mysql_ 을 실행하면 DB 컨테이너와 웹 서버가 연결되어 있음을 확인해 볼 수 있다.

### 5. Pycharm 가상 환경을 도커로 설정
파이참 Preference > Build, Execution, Deploy 로 이동해 아래와 같이 새로운 도커 이름을 등록한다.  
Local Path 는 내 소스코드 위치, Virtual Machine Path 는 소스코드가 마운트 될 위치이다. (2) 번에서 수정한 것과 동일하게 쓰면 된다.  

Python Interpreter에 가서 Python Interpreter 를 추가해야 한다. 아래 그림과 같이 Add 를 누른다.

그리고 아래와 같이 만들고, Ok 를 눌러주면 도커 웹 서버 안의 설정이 가상환경으로 잡히면서 연결된다. 

### 5. Migration
웹 서버에서 다음을 실행한다.
```bash
aerich migrate
```
만약 migrations 에 있는 마이그레이션 파일 대로 진행이되지 않으면, 일단 migration 폴더를 삭제한 후 아래를 실행한다.
```bash
aerich init -t database.TORTOISE_ORM
aerich init-db
```
테이블을 새로 추가하거나, 컬럼이 추가/수정 되었을 때는 아래와 같은 순서로 마이그레이션을 실행한다.
```bash
aerich migrate 혹은 aerich migrate --name add_new_table_or_edit_or_add_column
aerich upgrade
```

### 6. 웹서버 호출해보기
http://127.0.0.1:8005/hello/testfastapi 를 호출해본다.
그리고 다른 api 는 아래 문서를 통해 확인해 볼 수 있다.
```bash
http://127.0.0.1:8005/docs
```

### 7. git push 전에는 balck 사용
아래와 같이 black filt/path 로 코드 스타일 자동화를 실행한다.
