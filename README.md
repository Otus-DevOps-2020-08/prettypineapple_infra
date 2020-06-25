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

- bastion_IP = 35.228.138.52
- someinternalhost_IP = 10.166.0.9

### Дополнительное задание - SSL-сертификат для Pritunl

1. С помощью **Certbot** был сгенерирован сертификат для доменного имени **35-228-138-52.sslip.io**;
2. Соединение с **Pritunl** проксируется через **nginx**, для которого настроено использование сертификатов.

Корректную работу SSL-соединения можно проверить, перейдя по ссылке https://35-228-138-52.sslip.io/

## Домашнее задание к лекции №6

### Конфигурация и данные для подключения
testapp_IP = 35.195.244.180
testapp_port = 9292

### Команда для создания правила через gcloud sdk

```gcloud compute firewall-rules create default-puma-server --allow tcp:9292 --target-tags=puma-server```

### Команда для создания и настройки виртуальной машины

```
gcloud compute instances create reddit-app2\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=startup.sh
```
