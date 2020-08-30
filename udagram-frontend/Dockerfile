FROM beevelop/ionic AS ionic

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json /usr/src/app/
COPY ionic.config.json /usr/src/app/

# Install dependencies
RUN npm ci

# Copy app source
COPY . /usr/src/app/

# 
RUN ionic build

# Use nginx base image for deployment
FROM nginx:alpine

# Bind the port that the image will run on
EXPOSE 8100

# replace web directory
RUN rm -rf /usr/share/nginx/html/*
COPY --from=ionic /usr/src/app/www/ /usr/share/nginx/html/
