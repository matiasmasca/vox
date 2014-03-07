# language: es
Característica: editar un premio
  Con la finalidad de poder modificar los datos de un premio
  como un usuario registrado de una organización
  Quiero poder editar un premio, que yo he creado, en el sistema

#Camino feliz
Escenario: editar premio
  Dado que estoy en la pantalla de mis procesos electorales
  Y existe un premio llamado "Premios ACME43" que se realizara en "Av. Siempre Viva 742"
  Cuando yo edito el premio
  Y cambio el nombre por "Premios ACME" y el lugar por "6925 Hollywood Blvd, Hollywood, CA 90028, Estados Unidos"
  Entonces veo que el nombre cambio y la dirección cambio.

Escenario: agrego dato que faltaba
  Dado que estoy en la pantalla de mis procesos electorales
  Y existe un premio llamado "Premios ACME" que se realizara en "Av. Siempre Viva 742", sin duración definida
  Cuando yo edito el premio
  Y cambio el duracion por "30"
  Entonces veo que la duración cambio, sin afectar a nombre o lugar.
  

#Casos extremos
#En la versión futura, debería de cambiar las fechas de inicio y cierre cuando cambia la duración.