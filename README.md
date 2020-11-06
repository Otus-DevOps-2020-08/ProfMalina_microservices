# ProfMalina_microservices
ProfMalina microservices repository

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
