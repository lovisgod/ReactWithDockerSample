# this is build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# this is run phase
FROM nginx
# copy files from the build directory to the html directory in the ngnix container
COPY --from=builder /app/buid/ /usr/share/nginx/html
 