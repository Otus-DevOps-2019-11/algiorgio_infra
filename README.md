# algiorgio_infra
algiorgio Infra repository

#### Подключение одной командой через бастион хост
ssh -i ~/.ssh/appuser -J appuser@35.195.193.217 appuser@10.132.0.6

#### Конфигурация VM

bastion_IP = 35.195.193.217
someinternalhost_IP = 10.132.0.6


#### Конфигурация Test App

testapp_IP = 35.242.243.104
testapp_port = 9292

#### Скрипт для создания инстанса приложения
Доступ к скприпту по адресу:
https://storage.cloud.google.com/algiorgio-infra/startup_script.sh

Команда gcloud для запуска создания инстанса с использованием указанного скрипта:
```bash
gcloud compute instances create reddit-app \
    --boot-disk-size=10GB \
    --image-family ubuntu-1604-lts \
    --image-project=ubuntu-os-cloud \
    --machine-type=g1-small \
    --tags puma-server \
    --restart-on-failure \
    --zone europe-west3-a \
    --metadata startup-script-url=gs://algiorgio-infra/startup_script.sh
```
#### Создание правла для файервола
Команда gcloud для создания правила:
```bash
gcloud compute firewall-rules create default-puma-server \
      --allow tcp:9292 \
      --source-ranges="0.0.0.0/0" \
      --target-tags=puma-server
```
