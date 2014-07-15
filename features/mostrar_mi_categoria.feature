# language: es
Característica: mostrar información de mi categoria
  Con la finalidad de poder ver todos los datos de una categoría
  como un usuario registrado de una organización
  Quiero poder ver todos los datos una categoría, que yo he creado, en el sistema

Antecedentes:
  Dado existe un Usuario: "pepeargento", "pepe@argentos.com.ar", "sevieneeltiburon" y "1"
  Dado existe una Organización: "ACME-ARG", "Av. Siempre Viva 742", "ong.org.ar" y "info@email.com" asociada al usuario "pepeargento".
  Dado que existe un Proceso: "Reina del Desierto", "Alguna ciudad", "15"  asociado a mi organizacion "ACME-ARG".
  Dado que existe una Categoría: "Miss Simpatia del Desierto" asociado a mi proceso "Reina del Desierto".
  Dado que estoy en la pantalla de mis categorias

#Camino feliz
Escenario: mostrar categoría 
  Cuando hago click en Mostrar para categoría "Miss Simpatia del Desierto"
  Entonces veo toda la información de la categoría.

#Casos extremos.
Escenario: ver la categoría de otra organización
  Dado existen 2 usuarios A y B
  Dado existe una Organización: "ACME-A", "Av. Siempre Viva 742", "ong.org.ar" y "info@email.com" asociada al usuario "usuario01".
  Y que existe un Proceso: "categorías ACME 3th. Editar", "Alguna ciudad", "15"  asociado a mi organizacion "ACME-A".
  Cuando B trata de ver el categoría de A
  Entonces me muestra el mensaje "Solo puedes operar sobre los procesos que tu hayas creado."



#@to-do
#El proceso no existe.
#por ejemplo Ingresa un ID que no existe en la url.

#Trata de ver detalles de un proceso que el no creo.

