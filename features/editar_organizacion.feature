# language: es
Característica: editar una organización
  Con la finalidad de poder modificar los datos de una Organización
  como un usuario administrador
  Quiero poder editar una Organización en el sistema

#Camino feliz
@wip
Escenario: editar una organización
  Dado existe una organización llamada "ACME43" con domicilio en "Av. Siempre Viva 742"
  Y que estoy en la pantalla de Administración de Organizaciones
  Cuando yo edito una Organización
  Y cambio el nombre por "ACME", la diereción por "6925 Hollywood Blvd, Hollywood, CA 90028, Estados Unidos"
  Entonces veo que el nombre cambio y la dirección cambio.

Escenario: agrego dato que faltaba
  Dado existe una Organización llamada "ACME" con domicilio en "Av. Siempre Viva 742", sin web definida
  Y que estoy en la pantalla de Administración de Organizaciones
  Cuando yo edito la Organización
  Y cambio web por "www.acme.org"
  Entonces veo que la web cambio, sin afectar a nombre o dirección.
  

#Casos extremos
#En la versión futura, debería de cambiar las fechas de inicio y cierre cuando cambia la duración.

#Esto se puede refactorizar para aplicar DRY, con background.