FROM node:14-alpine

WORKDIR /app

COPY package.json .

RUN npm i

COPY . .

RUN npm run build

FROM nginx:latest

COPY --from=0 /app/build /usr/share/nginx/html
