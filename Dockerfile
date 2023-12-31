FROM node:20-alpine3.17 as builder

WORKDIR /app

COPY package.json /app/

RUN npm install -g npm@9.8.1

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html