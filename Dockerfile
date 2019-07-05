FROM node:8 as builder
ENV BUILD_FOLDER=/usr/src/app
WORKDIR ${BUILD_FOLDER}
COPY package*.json ${BUILD_FOLDER}/
RUN npm install
COPY . ${BUILD_FOLDER}/
RUN npm run build -- --env=prod

FROM nginx:1.13-alpine
COPY --from=builder /usr/src/app/public /usr/share/nginx/html
