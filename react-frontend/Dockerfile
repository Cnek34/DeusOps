FROM alpine:3.18
RUN apk add --no-cache nodejs npm libstdc++

WORKDIR /app

COPY package*.json ./
RUN npm ci && \
    npm cache clean --force

RUN addgroup -S frontgroup && adduser -S frontuser -G frontgroup
RUN mkdir -p /app/node_modules/.cache && chown -R frontuser:frontgroup /app/node_modules/.cache
USER frontuser

COPY . .

EXPOSE 3000

ENTRYPOINT ["npm", "start"]