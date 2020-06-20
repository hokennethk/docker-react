### BUILD STAGE ###
FROM node:14.4.0-alpine3.10 AS builder

WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .

RUN npm run build

### RUN STAGE ###
FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html

