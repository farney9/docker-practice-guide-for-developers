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
<<<<<<< HEAD
RUN npm run test

#Eliminar archivos y directorio sinecesarios en produccion
RUN rm -rf tests && rm -rf node_modules

#Instalar dependencias en produccion
RUN npm install --prod
=======

RUN npm run test
>>>>>>> bc70eed (Fix)

# Comando para ejecutar la aplicacion
CMD ["node", "app.js"]