# language: es
Característica: borrar un premio
  Con la finalidad de borrar un premio que ya no se utiliza
  como un usuario registrado de una organización
  Quiero poder eliminar un premio en el sistema

#Camino feliz
# Borrar desde listado
Escenario: borrar premio
  Dado existe un premio llamado "Premios ACME" que se realizara en "Av. Siempre Viva 742"
  Y que estoy en la pantalla de mis procesos electorales
  Cuando hago click en Borrar para "Premios ACME"
  Entonces se borra el premio


# IceBox
# Borrar desde otro lugar?
# Un usuario solo puede borrar sus propios procesos.

# Testear la ventana de confirmación:
#  Y me muestra una pantalla de confirmación

# Mensaje la organización fue borrado.
