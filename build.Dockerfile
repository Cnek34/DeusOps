FROM system AS build

COPY package*.json ./

RUN npm ci && npm cache clean --force

COPY . .

RUN npm run build