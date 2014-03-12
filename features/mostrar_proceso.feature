# language: es
Característica: mostrar información de un premio
  Con la finalidad de poder ver todos los datos de un premio
  como un usuario registrado de una organización
  Quiero poder ver todos los datos un premio, que yo he creado, en el sistema

#Camino feliz
Escenario: mostrar premio
  Dado existe un premio llamado "Premios ACME43" que se realizara en "Av. Siempre Viva 742"
  Dado que estoy en la pantalla de mis procesos electorales
  Cuando hago click en Mostrar para "Premios ACME43"
  Entonces veo toda la información del premio.

#Casos extremos.
#El proceso no existe.
#por ejemplo Ingresa un ID que no existe en la url.

#Trata de ver detalles de un proceso que el no creo.