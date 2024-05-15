FROM nginx:latest

COPY /src /usr/share/nginx/html

RUN chmod g+rx -R /usr/share/nginx/html


