# DevOps ansible project

## Описание
Написать приложение, которое при помощи API (REST API), будет создавать ВМ в облаке VK используя terraform и устанавливать на них сценарии ansible-playbook (3-5 вариантов сценариев)

## Порядок установки
- Клонировать репозиторий
```bash
git clone git@github.com:DreadnoughtN/DevOps-project.git
```
- Переходим в рабочий каталог
```bash
cd DevOps-project
```
- Запуск terraform
```
cd terraform
terraform init
terraform apply
```
- Ожидаем окончание процесса создания виртуальной машины в облаке
- Назначаем внешний ip-адрес ВМ в VK cloud 
- Копируем файлы проекта на ВМ
```bash
scp project-root.zip ubuntu@<IP-АДРЕС>:~/
scp install.sh ubuntu@<IP-АДРЕС>:~/
```
- Запускаем скрипт развёртывания проекта на ВМ
```bash
ssh ubuntu@<IP-АДРЕС>
/bin/bash install.sh
```
- Открываем браузер и переходим по внешнему IP-адресу ВМ