FROM node:18.18.0 as build
RUN yarn global add pm2
WORKDIR /app
COPY package*.json ./
RUN yarn install
COPY . .
RUN yarn build

FROM node:18.18.0
WORKDIR /app
COPY --from=build /app/dist ./dist
RUN yarn install

CMD [ "pm2-runtime", "dist/main" ]
