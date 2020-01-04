# algiorgio_infra
algiorgio Infra repository


#### Создание правила для файервола
Команда gcloud для создания правила:


```
gcloud compute firewall-rules create default-puma-server \
      --allow tcp:9292 \
      --source-ranges="0.0.0.0/0" \
      --target-tags=puma-server 
```
      
      
### Образы системы

Для создания образов проекта используется packer. В проекте создано два параметризированных образа:
- fry-образ **packer/ubuntu16.json**: содержит описание образа VM, загрузку и запуск приложения необходимо производить вручную
- backed-образ **packer/immutable.json**: содержит описание образа VM, после установки которого приложение автоматически работает на развернутой машине
- **packer/variables.json** - переменные для шаблона образа

Операции, производимые на развернутом образе виртуальной машины находятся в директории **packer/scripts**.

Файлы, связанные с созданием рабочего приложения на развернутом образе виртуальной машины находятся в директории **packer/files**.

#### Создание виртуальной машины
 1) Для создания fry-образа в каталоге packer необходимо выолнить команду:


    packer build -var-file variables.json ubuntu16.json

после чего, на основе полученного образа, создать инстанс виртуальной машины.

2) Для создания backed-образа в каталоге packer необходимо выолнить команду:

    packer build -var-file variables.json ubuntu16.json
после чего исполнить скрипт следующего содержания:

```
    gcloud beta compute instances create reddit-full \
        --project=infra-262812 \
        --image=reddit-full-1577957275 \
        --image-project=infra-262812 \
        --zone europe-west3-a \
        --machine-type=g1-small \
        --subnet=default \
        --tags puma-server \
        --restart-on-failure \
        --boot-disk-size=10GB \
        --boot-disk-type=pd-ssd
```

расположенный по адресу **config-scripts/create-reddit-vm.sh**
