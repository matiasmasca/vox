# language: es
Característica: mostrar información de un premio
  Con la finalidad de poder ver todos los datos de un premio
  como un usuario administrador
  Quiero poder ver todos los datos un premio, que yo he creado, en el sistema

Antecedentes:
  Dado que estoy logueado como "Administrador"

#Camino feliz
Escenario: mostrar premio
  Dado existe un Usuario: "pepeargento", "pepe@argentos.com.ar", "sevieneeltiburon" y "1"
  Dado existe una Organización: "ACME-ARG", "Av. Siempre Viva 742", "ong.org.ar" y "info@email.com" asociada al usuario "pepeargento".
  Dado que existe un Proceso: "Reina del Desierto", "Alguna ciudad", "15" asociado a mi organizacion "ACME-ARG".
  Dado que estoy en la pantalla de "administración de procesos"
  Cuando hago click en Mostrar para "Premios ACME 2014"
  Entonces veo toda la información del premio.

#Casos extremos.
#@to-do
#El proceso no existe.
#por ejemplo Ingresa un ID que no existe en la url.

