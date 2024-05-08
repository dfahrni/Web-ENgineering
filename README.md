# Web-Engineering


## Voraussetzungen:

Ubuntu, CLI, Root, Docker Installed

1. Erstellen eines Ordners "Web-Engineering"<p>
```
mkdir Web-Engineering
```
3. Unterotner erstellen von Uebung1<p>
```
mkdir Uebung1
```
4. Sämtlicher Inhalt aus der Uebung1 in dieses Unterverzeichnis Kopieren und mit ```cd /home/web-server01/Web-Engineering/Uebung1 ``` hinnavigieren

## Docker Container

Packe die Website in einen Docker Container

1. Erstelle ein Dockerfile im Wurzelverzeichnis:

[DockerFile](Dockerfile)


2. Erstelle und starte anschliessend das container image. Du solltest nun die Webseite auf `localhost` im Browser
   erreichen.

```shell
docker build . --tag webengineering
docker run --name webengineering --detach --publish 80:80 webengineering 
```

3. Stoppe den Container mit `docker stop webengineering` und lösche ihn mit `docker rm webengineering`
4. Erstelle ein docker-compose file (`docker-compose.yml`):

[Docker-Compose.yml](docker-compose.yml)

5. Nun kannst du den container mit `docker-compose up` starten. Nutze `docker-compose up --build` um das Image vor dem
   Starten neu zu builden.


## Deployment

Installieren von Azure CLI unter Ubuntu <p>
Option 1: Install with one command

```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

## Script
```
#!/bin/bash

# Docker image bauen und laufen lassen
docker build . --tag webengineering
docker run --name webengineering --detach --publish 80:80 webengineering
docker stop webingineering
docker rm webengineering

# Docker Compose Befehle
docker-compose up --build
docker-compose up

# Azure Resource Management
az group create --name TEKO --location eastus
az acr create --resource-group TEKO --name webengineering --sku Basic
az acr login --name webengineering

# Docker Images auf Azure Registry pushen
docker tag webengineering webengineering.azurecr.io/webengineering:v1
docker push webengineering.azurecr.io/webengineering:v1

# Azure Container Registry (ACR) Befehle
az acr repository list --name webengineering --output table
az acr repository show-tags --name webengineering --repository webengineering --output table

# Azure Container Instance (ACI) erstellen
az container create --resource-group TEKO --name webengineering --image webengineering.azurecr.io/webengineering:v1 --cpu 1 --memory 1 --registry-login-server webengineering.azurecr.io --registry-username <service-principal-ID> --registry-password <service-principal-password> --ip-address Public --dns-name-label <aciDnsLabel> --ports 80

# Informationen anzeigen
az acr show --name webengineering --query loginServer
az acr show --name webengineering --query loginServer --output table
```

