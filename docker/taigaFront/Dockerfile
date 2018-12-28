FROM nginx:alpine

RUN apk add git

WORKDIR /apps

RUN git clone https://github.com/taigaio/taiga-front-dist.git taiga-front

WORKDIR /etc/nginx/conf.d
RUN rm default.conf
COPY ./default.conf default.conf

WORKDIR /apps/taiga-front
RUN git checkout stable
RUN mkdir -p logs
COPY ./conf.json .

EXPOSE 80

