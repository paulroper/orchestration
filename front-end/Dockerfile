FROM node:8.11.3-alpine

WORKDIR /var/code
COPY . .

RUN apk --no-cache add ca-certificates
RUN npm install

CMD ["npm", "start", "--", "--port", "8080"]
