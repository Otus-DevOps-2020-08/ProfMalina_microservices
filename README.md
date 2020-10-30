# ProfMalina_microservices
ProfMalina microservices repository

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
