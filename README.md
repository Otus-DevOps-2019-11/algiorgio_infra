# algiorgio_infra
algiorgio Infra repository

#### Подключение одной командой через бастион хост
ssh -i ~/.ssh/appuser -J appuser@35.195.193.217 appuser@10.132.0.6

#### Конфигурация VM

bastion_IP = 35.195.193.217
someinternalhost_IP = 10.132.0.6
