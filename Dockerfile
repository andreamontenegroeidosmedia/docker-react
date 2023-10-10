FROM node:16-alpine AS builder

WORKDIR /app

# Setup dependencies
COPY package.json .
RUN npm install

# Copy source files
COPY . .

CMD [ "npm", "run", "build" ]

# ---

FROM nginx

# Tells Elastic Beanstalk what port to use
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html

# Image default command will start NGINX



