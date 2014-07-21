# language: es
Característica: borrar un premio
  Con la finalidad de borrar un premio que ya no se utiliza o que tiene información incorrecta.
  como un usuario registrado de una organización
  Quiero poder eliminar un premio vinculado a mi organización

Antecedentes:
  Dado que estoy logueado como "Organizador"
  Dado que existe un Proceso: "Premios ACME", "Alguna ciudad", "15"  asociado a mi organizacion "Nerv Corp.".
  Y que estoy en la pantalla de "dashboard usuario"
  Y que presione el botón "Mis procesos" 
  #/organizers/9/selection_processes

#Camino feliz
# Borrar desde listado
Escenario: borrar premio  
  Cuando hago click en Borrar para "Premios ACME"
  Entonces se borra el premio "Premios ACME"
  Entonces me muestra el mensaje "Ud. no tiene registros creados. Cuando los haya creado se listaran aqui."

#Tengo varios, borrar el primero
Escenario: borrar premio el 2do. premio  
  Dado que existe un Proceso: "Premios Reina del Desierto 2014", "Alguna ciudad", "15"  asociado a mi organizacion "ACME-ARG".
  Cuando hago click en Borrar para "Premios ACME"
  Entonces se borra el premio "Premios ACME"
  Entonces me muestra el mensaje "Proceso borrado correctamente."

# IceBox
# Borrar desde otro lugar?
# Un usuario solo puede borrar sus propios procesos.

# Testear la ventana de confirmación:
#  Y me muestra una pantalla de confirmación

# Mensaje la organización fue borrado.
