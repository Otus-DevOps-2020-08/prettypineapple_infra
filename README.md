# prettypineapple_infra
prettypineapple Infra repository

## Домашнее задание к лекции №5

### Подключение к someinternalhost одной командой

`ssh -i ~/.ssh/appuser -A -t appuser@35.228.138.52 ssh appuser@10.166.0.9`

### Дополнительное задание - ssh someinternalhost

Для подключения к someinternalhost с локальной машины с помощью команды `ssh someinternalhost` к файлу `~/.ssh/config` были добавлены строки

```
Host bastion
	HostName 35.228.138.52
        User appuser
	IdentityFile ~/.ssh/appuser

Host someinternalhost
        HostName 10.166.0.9
        ProxyJump appuser@35.228.138.52
        User appuser
```

### Конфигурация и данные для подключения

bastion = 35.228.138.52
someinternalhost = 10.166.0.9

### Дополнительное задание - SSL-сертификат для Pritunl

1. С помощью **Certbot** был сгенерирован сертификат для доменного имени **35-228-138-52.sslip.io**;
2. Соединение с **Pritunl** проксируется через **nginx**, для которого настроено использование сертификатов.

Корректную работу SSL-соединения можно проверить, перейдя по ссылке https://35-228-138-52.sslip.io/
