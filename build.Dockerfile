FROM system_img

COPY package*.json ./

RUN npm ci && npm cache clean --force

COPY . .

RUN npm run build