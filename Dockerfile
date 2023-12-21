FROM node:18.18.0 as build

WORKDIR /app

COPY package*.json ./
RUN yarn install

COPY . .
RUN yarn build
EXPOSE 3000
# Install PM2 globally
RUN yarn global add pm2
CMD [ "yarn","start" ]