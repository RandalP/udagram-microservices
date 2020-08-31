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

# replace web directory
COPY --from=ionic /usr/src/app/www/ /usr/share/nginx/html/
