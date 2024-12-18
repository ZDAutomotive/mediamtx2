#!/bin/bash

NAME=mediamtx:1.10.0
REGISTRY=test.zddata.cloud:8443/autoincar

sudo docker build -t $NAME .
# 登录
sudo docker login $REGISTRY
# 为本地镜像添加标签
sudo docker tag $NAME $REGISTRY/$NAME
# 推送
sudo docker push $REGISTRY/$NAME