# test_work

Задание 1.

1) Написать bash скрипт который печатает hello world!!! Каждые 10 секунд
Решение:

#!/bin/bash
while :
do
	echo "hello world!!!"
	sleep 10
done


2) Создать linux сервис который запускает этот скрипт

Решение:

[Unit]
	Description= start hello world script
[Service]
	ExecStart=/usr/bin/hw_script.sh
	Type=simple
	StandardOutput=tty
 
 Задание 2.
 
 1) Создать докер-образ (Dockerfile), который при запуске загружает определенный проект с github и размещает его в папку /code внутри контейнера 
Загрузка проекта должна происходить при запуске контейнера(не в момент сборки образа!) 

Решение:

FROM debian

RUN apt-get update && apt-get upgrade -y && apt-get install -y git
WORKDIR /code 
ENTRYPOINT ["git", "clone"] 
CMD ["https://github.com/MVGruznov/test_work.git"]

2) Параметризировать адрес гит репозитория, с которого будет загружен код. 

Решение:
Для загрузки кода с репозитория отличного от дефолтного необходимо передать его адрес в качестве параметра при запуске контейнера, например:
docker build -t test .
docker run -ti test https://github.com/MVGruznov/test_work.git

3) Разместить загруженный код в папке /tmp/code на машине хоста. 

Решение: 
docker build -t test .
docker run -ti test
docker run -v /tmp/code:/code test 

4) Настроить docker-compose файл, позволяющий выполнять пункты 2 и 3. 

Решение:

version: '3'
services:
    git-clone:
        build: .
        volumes:
            - /tmp/code:/code
