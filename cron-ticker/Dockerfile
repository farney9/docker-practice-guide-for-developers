# /app /usr /lib
FROM node:19.2-alpine3.16

# cd app
WORKDIR /app

#dest /app
COPY package.json ./

#Instalar las dependencias
RUN npm install

#dest /app
COPY . .

#Realizar testing
RUN npm run test

#Eliminar archivos y directorio sinecesarios en produccion
RUN rm -rf tests && rm -rf node_modules

#Instalar dependencias en produccion
RUN npm install --prod

# Comando para ejecutar la aplicacion
CMD ["node", "app.js"]