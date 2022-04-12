# Commerce Api with FastApi

## Overview
FastApi 를 사용해 api 서버를 구축합니다. 아래 가이드를 참고하세요.

## Delvelopment environment
* Language: Python3.10
* OS: Utuntu20.04
* WSGI/ASGI: uvicorn

모든 필요한 디펜던시는 Dockerfile 을 통해 설치됩니다.

### 0. python3.10 을 내 pc 로컬에 설치한다.
brew 설치후 python3.10 을 설치 한다. (링크 참고: https://formulae.brew.sh/formula/python@3.10)

### 1. 소스코드 다운받기
코드 다운 받은 후, 파이참으로 프로젝트를 연다.
이때 중요한건, python project interpreter 를 위에서 설치한 python3.10 경로로 잡아 주어야 한다.
그리고 로컬 코드 수정에 용이하도록 FastApi 로 설정한다.

### 2. 소스코드 위치 수정하기
도커로 웹 서버를 띄우기 전 마운트될 소스코드 위치를 수정한다.
"~/PycharmProjects/commerce_api" 이 부분을 본인 소스코드 로컬 Path 로 변경한다.

### 3. 도커로 웹서버 띄우기
이후 터미널을 통해 commerce_api 폴더까지 이동한다.
그리고 아래 쉘 스크립트를 실행한다.
```bash
chmod +x ./setup.sh
./setup.sh 혹은 sh setup.sh
```

### 4. 웹서버 호출해보기
http://127.0.0.1:8005/hello/testfastapi 를 호출해본다.
그리고 다른 api 는 아래 문서를 통해 확인해 볼 수 있다.
```bash
http://127.0.0.1:8005/docs
```