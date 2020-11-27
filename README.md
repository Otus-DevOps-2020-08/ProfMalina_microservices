[![Build Status](https://travis-ci.com/Otus-DevOps-2020-08/ProfMalina_microservices.svg?branch=master)](https://travis-ci.com/Otus-DevOps-2020-08/ProfMalina_microservices)

# ProfMalina_microservices
ProfMalina microservices repository

# gitlab-ci-1

С помощью terraform поднял инстанс

Создал роли для запуска gitlab in docker, запуск и регистрация gitlab-runner после указания токена в group_vars, ip забирается автоматически из inventory, который автоматически генерится





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
