FROM ubuntu
RUN apt-get update
RUN apt-get install nginx -y

FROM node:14-alpine

WORKDIR /usr/src/app

COPY rollup.config.js ./
COPY package*.json ./

RUN npm install

COPY ./src ./src
COPY ./public ./public

RUN npm run-script build

EXPOSE 5000

ENV HOST=0.0.0.0

CMD ["npm", "start" ,"nginx","-g","daemon off;"]