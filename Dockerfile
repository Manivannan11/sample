FROM node:10-alpine as build-step

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build --prod

# Stage 2

FROM nginx:1.17.1-alpine

COPY --from=build-step /app/www /usr/share/nginx/html
