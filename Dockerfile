FROM nginx:latest

COPY ../01_HTML_CSS /usr/share/nginx/html

RUN chmod g+rx -R /usr/share/nginx/html


