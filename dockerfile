FROM node:20-alpine3.18 AS builder

WORKDIR /app

COPY package*.json /app

RUN npm ci

COPY . .

RUN npm run test 

FROM node:20-alpine3.18 

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 8000

CMD ["node",  "./app.js" ]
