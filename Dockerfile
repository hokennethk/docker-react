### BUILD STAGE ###
FROM node:14.4.0-alpine3.10

WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .

RUN npm run build

### RUN STAGE ###
FROM nginx:alpine
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

