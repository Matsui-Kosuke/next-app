FROM node:16-alpine3.16
RUN apk update && \
    apk add bash git make && \
    apk add --upgrade grep
RUN git clone https://github.com/awslabs/git-secrets /home/alpine/git-secrets
WORKDIR /home/alpine/git-secrets
RUN make && make install
WORKDIR /api
COPY package*.json ./
RUN yarn install && \
    yarn global add @nestjs/cli@9.1.2
COPY . .