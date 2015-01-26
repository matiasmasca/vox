# language: es
Característica: editar mi premio
  Con la finalidad de: controlar la información que ve el publico sombre un premio que organiza mi organización; y manejar la imagen que se comunica.
  Como un usuario perteneciente a una organización
  Quiero poder editar un premio en el sistema organizado por mi Organización 

Antecedentes:
  Dado que estoy logueado como "Organizador"
  # Dado existe un Usuario: "pepeargento", "pepe@argentos.com.ar", "sevieneeltiburon" y "1"
  # Dado existe una Organización: "ACME-ARG", "Av. Siempre Viva 742", "ong.org.ar" y "info@email.com" asociada al usuario "pepeargento".
  Dado que existe un Proceso: "Mejor batalla", "Alguna ciudad", "15" asociado a mi organizacion "Nerv Corp.".
  Y que estoy en la pantalla de "Modificar Mi Proceso"
  Cuando yo edito mi Proceso 

# Camino feliz
Escenario: editar premio
  Dado cambio el nombre por "Premios ACME" y el lugar por "6925 Hollywood Blvd, Hollywood, CA 90028, Estados Unidos"
  Entonces veo que el nombre cambio y la dirección cambio.

# Casos extremos
Esquema del escenario: problemas con datos obligatorios
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
  Dado que existe un Proceso: "Premios ACME 1st. Editar", "Alguna ciudad", "15" asociado a mi organizacion "Nerv Corp.".
  Y que existe un Proceso: "Premios ACME 2nd. Editar", "Alguna ciudad", "15" asociado a mi organizacion "Nerv Corp.".
  Y que estoy en la pantalla de "Modificar Proceso"
  Cuando yo edito el 2do. premio
  Y cambio, de mi proceso: "Premios ACME 1st. Editar", "6925 Hollywood Blvd, Hollywood, CA 90028, Estados Unidos" o "30"
  Entonces me muestra el mensaje de error que "ese nombre ya está siendo utilizado"

Escenario: modificar el premio de otra organización
  Dado existen 2 usuarios A y B
  Dado existe una Organización: "ACME-A", "Av. Siempre Viva 742", "ong.org.ar" y "info@email.com" asociada al usuario "usuario01".
  Y que existe un Proceso: "Premios ACME 3th. Editar", "Alguna ciudad", "15" asociado a mi organizacion "ACME-A".
  Cuando B trata de modificar el premio de A
  Entonces me muestra el mensaje "Solo puedes operar sobre los procesos que tu hayas creado."