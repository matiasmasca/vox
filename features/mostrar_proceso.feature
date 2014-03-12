# language: es
Característica: mostrar información de un premio
  Con la finalidad de poder ver todos los datos de un premio
  como un usuario registrado de una organización
  Quiero poder ver todos los datos un premio, que yo he creado, en el sistema

#Camino feliz
Escenario: mostrar premio
  Dado que estoy en la pantalla de mis procesos electorales
  Y existe un premio llamado "Premios ACME" que se realizara en "Av. Siempre Viva 742"
  Cuando hago click en Mostrar para "Premios ACME"
  Entonces veo toda la información del premio.