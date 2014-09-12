# language: es
Característica: mostrar información de mi premio
  Con la finalidad de poder ver todos los datos de un premio
  como un usuario registrado de una organización
  Quiero poder ver todos los datos un premio, que yo he creado, en el sistema

Antecedentes:
  Dado que estoy logueado como "Organizador"
  #Dado existe un Usuario: "pepeargento", "pepe@argentos.com.ar", "sevieneeltiburon" y "1"
  #Dado existe una Organización: "ACME-ARG", "Av. Siempre Viva 742", "ong.org.ar" y "info@email.com" asociada al usuario "pepeargento".
  Dado que existe un Proceso: "Reina del Desierto", "Alguna ciudad", "15" asociado a mi organizacion "Nerv Corp.".
  Dado que estoy en la pantalla de "Mis procesos"

#Camino feliz
Escenario: mostrar premio 
  Cuando hago click en Mostrar para "Premios ACME 2014"
  Entonces veo toda la información del premio.

#Casos extremos.
# Esta prueba quedo deprecada, por cambio de politica al mostrar los procesos.
#Escenario: ver el premio de otra organización
#  Dado existen 2 usuarios A y B
#  Dado existe una Organización: "ACME-A", "Av. Siempre Viva 742", "ong.org.ar" y "info@email.com" asociada al usuario "usuario01".
#  Y que existe un Proceso: "Premios ACME 3th. Editar", "Alguna ciudad", "15" asociado a mi organizacion "ACME-A".
#  Cuando B trata de ver el premio de A
#  Entonces me muestra el mensaje "Solo puedes operar sobre los procesos que tu hayas creado."

#@to-do
#El proceso no existe.
#por ejemplo Ingresa un ID que no existe en la url.

#Trata de ver detalles de un proceso que el no creo.

