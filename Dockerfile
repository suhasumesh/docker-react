FROM node:16-alpine as builder    
#we need a specific version of Node to avoid bugs

WORKDIR '/frontend'

COPY ["package*.json","."]
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# COPY  --from=stage  syntax   https://hub.docker.com/_/nginx  refer this 
COPY --from=builder /frontend/build /usr/share/nginx/html