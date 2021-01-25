FROM node:14-slim

ENV GATSBY_TELEMETRY_DISABLED 1
ENV HOME /app

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Remove config created by apps
RUN rm -rf /app/.config

CMD [ "npm", "start" ]