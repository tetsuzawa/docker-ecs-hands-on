FROM node:15.14.0-alpine3.13

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package*.json ./
RUN npm install && npm cache clean --force

COPY . .
