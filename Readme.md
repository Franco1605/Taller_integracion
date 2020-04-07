# Entrega Tarea 1 #

Este es el repositorio de Franco Castillo que contiene el código de la tarea 1 para el curso "Taller de Integración".
Cabe destacar, que en la entrega existió una incompatibilidad entre heroku y la gema sqlite3, por lo que el archivo "Gemfile" fue modificado varias veces, agregando y eliminando las gemas de postgres y sqlite3. Por lo que, puede existir dicha diferencia entre ambas partes.

# A considerar #
Para correr localmente el código, se debe ingresar al archivo GemFile, descomentar la gema de sqlite3 y comentar la gema de pg (postgres). Luego, en el directorio, se debe correr el comando "bundle" o "bundle install", para instalar las gemas.
Finalmente, usar el comando "rails server" en consola y dirigirse a la página indicada (localhost:3000).
