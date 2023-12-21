FROM node:18.18.0 as build
RUN yarn global add pm2
WORKDIR /app

COPY package*.json ./
RUN yarn install

COPY . .
RUN yarn build
RUN yarn pm2:deploy:app

CMD [ "yarn","start" ]