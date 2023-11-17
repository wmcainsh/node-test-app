FROM node:20-bookworm-slim

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package.json yarn.lock ./

USER node

RUN yarn install

COPY --chown=node:node . .

ENV PORT 8080

EXPOSE 8080

CMD [ "yarn", "start" ]