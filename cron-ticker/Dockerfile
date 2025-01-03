# /app /usr /lib
FROM node:19.2-alpine3.16

# cd app
WORKDIR /app

#dest /app
COPY package.json ./

#Instalar las dependencias
RUN npm install

#dest /app
COPY app.js ./

# Comando para ejecutar la aplicacion
CMD ["node", "app.js"]
