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




2. Erstelle und starte anschliessend das container image. Du solltest nun die Webseite auf `localhost` im Browser
   erreichen.

```shell
docker build . --tag webengineering
docker run --name webengineering --detach --publish 80:80 webengineering 
```

3. Stoppe den Container mit `docker stop webengineering` und lösche ihn mit `docker rm webengineering`
4. Erstelle ein docker-compose file (`docker-compose.yml`):

```yaml
version: "1"
services:
  web:
    build: .
    container_name: webengineering
    restart: always
    ports:
      - "80:80"
```

5. Nun kannst du den container mit `docker-compose up` starten. Nutze `docker-compose up --build` um das Image vor dem
   Starten neu zu builden.


## Deployment

Installieren von Azure CLI unter Ubuntu <p>
Option 1: Install with one command

```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

