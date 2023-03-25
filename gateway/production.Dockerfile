#
# Builder stage.
# This state compile our TypeScript to get the JavaScript code
#
FROM node:19.4 AS builder

WORKDIR /usr/src/app

COPY package*.json ./
COPY tsconfig*.json ./
COPY ./src ./src

RUN npm ci --quiet && npm run build:prod

#
# Production stage.
# This state compile get back the JavaScript code from builder stage
# It will also install the production package only
#
FROM node:19.4-alpine

WORKDIR /app
ENV NODE_ENV=production

COPY package*.json ./
RUN npm ci --quiet --only=production

## We just need the build to execute the command
COPY --from=builder /usr/src/app/dist ./dist

CMD ["npm", "run", "start"]