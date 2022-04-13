FROM ubuntu:20.04
EXPOSE 8005

RUN apt-get update && apt-get upgrade -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install dnsutils -y
RUN apt-get install python3.10 -y
RUN apt-get install python3-pip -y
RUN apt-get install git -y
RUN apt-get install curl -y
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN apt-get install python3.10-distutils -y
RUN python3.10 get-pip.py
RUN mkdir /commerce_api
WORKDIR /commerce_api
RUN pip install fastapi uvicorn requests black tortoise-orm[aiomysql] aerich