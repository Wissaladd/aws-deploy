FROM node:18-alpine
RUN npm install pm2 yarn @nestjs/cli -g --force
WORKDIR /app
COPY package*.json ./
RUN yarn install --production
COPY . .
RUN yarn build
EXPOSE 3000
CMD ["yarn","pm2:start:app"]