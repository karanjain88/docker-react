# This is a muti-step build
# Step 1
FROM node:20-alpine as build
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Step 2
FROM nginx
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html


