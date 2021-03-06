[![Build Status](https://travis-ci.com/Otus-DevOps-2020-08/ProfMalina_microservices.svg?branch=master)](https://travis-ci.com/Otus-DevOps-2020-08/ProfMalina_microservices)

# ProfMalina_microservices
ProfMalina microservices repository

# kubernetes-5

Развернул prometheus и grafana в kubernetes кластере

Настроил таргеты для сбора метрик

Установил EFK в kubernetes кластере

# kubernetes-4

Установил Helm

Настроил tiller

Создал Chart для OTUS reddit

Опробовал работу с helm2 helm3

Установил с помощью helm gitlab в kubernetes кластер

Настроил CI

Настроил запуск отдельного окружения по коммиту

Добавил тригер для сборки в staging и production при пуше в мастер и прохождения всех тестов

# kubernetes-3

Попробовал тип доступа NodePort

Попробовал тип доступа LoadBalancer

Попробовал тип доступа Ingress

Защитил сервис с помощью TLS

Опишисал создаваемый объект Secret в виде Kubernetes-манифеста

Создал Network Policy для mongo

Создал постоянный volume для mongo

# kubernetes-2

Развернул локально kubernetes используя minikube

Развернул кластер на yandex-cloud используя терраформ

Настроил и поднял сервисы локально и в облаке

Подключился к dashboard

# kubernetes-1

Создал конфиги сервисов reddir для kubernetes

Прошел kubernetes-the-hard-way

Попробовал описать его в плэйбуках

# logging-1

Обновил код в дирректори /src и собрал новые образы

Создал docker-хост используя go и драйвер yandex

Создал отдельный compose-файл для системы логирования

Собрал образ Fluentd с необходимым конфигом

Добавил драйвер fluenев для логирования сервисов post и ui

Запустил сервисы и проверил работоспособность, а такжже посмотрел логи через kibana

Добавил фильтры для логов в fluent.conf используя grok шаблоны

Добавил и включил zipkin, изучил трейсы и исправил ошибку в bugged-code

# monitoring-1

Ссылка на DockerHub https://hub.docker.com/u/malinovskiyri

Выбрал https://github.com/percona/mongodb_exporter (это форк от dcu, но он обновляется)  и добавил в образ prometheus, а так же в docker-compose, образ собрал к себе в dockerhub из исходников

Подключил Blackbox exporter

Добавил Makefile с основными командами

Протестировал, что всё работает и исправил то что не работало

# gitlab-ci-1

С помощью terraform поднял инстанс

Создал роли для запуска gitlab in docker, запуск и регистрация gitlab-runner после указания токена в group_vars, ip забирается автоматически из inventory, который автоматически генерится

Создал тестовый проект и выполнил на нём задания

Добавил запуск контейнера с приложением reddit на стадии build

Добавил на стадии review деплой в динамическое окружение

Добавил оповещения в slack, поспамил в канал для дз https://devops-team-otus.slack.com/archives/C01ACRFM56W

# docker-4

Разобрался с работой сети в Docker

Посмотрел работу net-namespace

Создал сети для back и front, рассмотрел их работу, подключил необходимые контейнеры ко второй сети

Посмотрел как работает bridge в docker

Пример для docker-compose с 32-го слайда не рабочий, сервис comment теряет связь с бд, добавил `environment: - COMMENT_DATABASE_HOST=post_db`

Параметизировал `docker-compose.yml` и внес переменные в `.env`, проверил работоспособность

Базовое имя проекта берётся из названия папки в которой находится docker-compose.yml, можно указать флагом `--project-name NAME`

Пример `docker-compose --project-name NAME up -d`

Очень полезная команда `docker-compose down --remove-orphans`, когда забыл сначала сделать `docker-compose down` и начал редактировать `yml`

Добавил `docker-compose.override.yml`

Вообще для разработки можно было бы заменить в Dockerfile COPY на монтирование папки с файлами, добавив в Dockerignore лишние файлы, тогда можно было бы кодить "на лету", а для прода сделать отдельный файлы с COPY для сбора готовых образов перед деплоем, через env как раз передавать prod или dev для выбора файла сборки `build: context: ./ui dockerfile: $(NAME_ENV).Dockerfile`, я так думаю

# docker-3

Установил hadolint

Сборка reddit из микросервиса через docker-machine на удалённом инстансе

Создание сети для docker

Запустил контейнеры

Запуск контейнеров с другими сетевыми alias

`docker run -d --network=reddit --network-alias=my_post_db --network-alias=my_comment_db mongo:latest`

`docker run -d --network=reddit --network-alias=post --env POST_DATABASE_HOST=my_post_db malinovskiyri/post:1.0`

`docker run -d --network=reddit --network-alias=comment --env COMMENT_DATABASE_HOST=my_comment_db malinovskiyri/comment:1.0`

`docker run -d --network=reddit -p 9292:9292 malinovskiyri/ui:1.0`

Сборка образа ui на alpine

Создание docker volume для хранения данных бд

Для уменьшения образа можно использовать файл .dockerignore

Комбинировать команды

Добавить команду && rm -rf /var/lib/apt/lists/* после использования apt

# docker-2

Установка docker docker-compose docker-machine

Сборка образа и отправка его в удалённый репозиторий

Подключение к удалённому инстансу при помощи docker-machine и запуск образа

`docker-machine create --driver generic --generic-ip-address=178.154.227.27 --generic-ssh-user yc-user --generic-ssh-key ~/.ssh/id_rsa docker-host`

`eval $(docker-machine env docker-host)`

Автоматизация поднятие инстанса с запуском образа

Для переключения на локальный докер
`eval $(docker-machine env --unset)`

Подключил оповещения travis в slack
