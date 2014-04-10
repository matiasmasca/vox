# language: es
Característica: editar una organización
  Con la finalidad de poder modificar los datos de una Organización
  como un usuario administrador
  Quiero poder editar una Organización en el sistema

#Camino feliz
Escenario: editar una organización
  
  Dado existe una Organización llamada "ACME43" con domicilio en "Av. Siempre Viva 742" y email "info@email.com"
  Y que estoy en la pantalla de Administración de Organizaciones
  Cuando yo edito una Organización
  Y cambio el nombre por "ACME", la domicilio por "6925 Hollywood Blvd, Hollywood, CA 90028, Estados Unidos"
  Entonces veo que el nombre cambio y la domicilio cambio.

Escenario: agrego dato que faltaba
  Dado existe una Organización llamada "ACME" con domicilio en "Av. Siempre Viva 742", sin web definida
  Y que estoy en la pantalla de Administración de Organizaciones
  Cuando yo edito una Organización
  Y cambio web por "www.acme.org"
  Entonces veo que la web cambio, sin afectar a nombre o dirección.
  

#Casos extremos
#Esto se puede refactorizar para aplicar DRY, con background.