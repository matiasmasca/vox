# language: es
Característica: editar un proceso
  Con la finalidad de poder modificar los datos de un premio
  como un usuario administrador
  Quiero poder editar un proceso de selección, existente en el sistema

Antecedentes:
  Dado que estoy logueado como "Administrador"

#Camino feliz
Escenario: editar premio
  Dado existe un premio llamado "Premios ACME43" que se realizara en "Av. Siempre Viva 742"
  Y que estoy en la pantalla de "administración de procesos"
  Cuando yo edito el premio
  Y cambio el nombre por "Premios ACME" y el lugar por "6925 Hollywood Blvd, Hollywood, CA 90028, Estados Unidos"
  Entonces veo que el nombre cambio y la dirección cambio.

Escenario: agrego dato que faltaba
  Dado existe un premio llamado "Premios ACME" que se realizara en "Av. Siempre Viva 742", sin duración definida
  Y que estoy en la pantalla de "administración de procesos"
  Cuando yo edito el premio
  Y cambio el duracion por "30"
  Entonces veo que la duración cambio, sin afectar a nombre o lugar.

#Casos extremos
Esquema del escenario: problemas con datos obligatorios
  Dado existe una Organización: "Nerv Corp.", "Nueva nueva tokio", "" y "eva01@nerv.com"
  Dado existe un premio llamado "Premios ACME43" que se realizara en "Av. Siempre Viva 742"
  Y que estoy en la pantalla de "administración de procesos"
  Cuando yo edito el premio
  Y cambio "<name_process>", "<place>" o "<duration>"  
  Entonces me muestra el mensaje de error que "faltan esos datos"

  Ejemplos: datos incorrectos
   | name_process | place                | duration   | 
   |              | Av. Siempre Viva 742 | 90         |
   | Moncho 2014  | Av. Siempre Viva 742 | varios días|
  
  Ejemplos: longitudes incorrectos
   | name_process | place                | duration | 
   | Monchos      | Av. Siempre Viva 742 | 90       |
   | Monchito     | MiDirec              | 90       |
   | Monchito     | Av. Siempre Viva 742 | 0        |
   | Monchito     | Av. Siempre Viva 742 | 366      |
   | 251CARACTERESAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA      | Av. Siempre Viva 742 | 360      |
   | Monchito     | 251CARACTERESAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA  | 360      |
 
Escenario: Nombre de premio, debe ser unico.
  Dado existe un premio llamado "Premios ACME 1st. Editar" que se realizara en "Av. Siempre Viva 742"
  Y existe un premio llamado "Premios ACME 2nd. Editar" que se realizara en "Av. Siempre Viva 742 2"
  Y que estoy en la pantalla de "administración de procesos"
  Cuando yo edito otro premio
  Y cambio "Premios ACME 1st. Editar", "6925 Hollywood Blvd, Hollywood, CA 90028, Estados Unidos" o "30"
  Entonces me muestra el mensaje de error que "ese nombre ya está siendo utilizado"

@to-do
Escenario: cambia las fechas de inicio, cuando cambia duracción.
# En la versión futura, debería de cambiar las fechas de inicio y cierre cuando cambia la duración.

#Esto se puede refactorizar para aplicar DRY, con background.