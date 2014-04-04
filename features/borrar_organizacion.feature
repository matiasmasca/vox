# language: es
Característica: borrar una organización
  Con la finalidad de borrar un premio que ya no se utiliza
  como un usuario registrado de una organización
  Quiero poder eliminar un premio en el sistema

#Camino feliz
# Borrar desde listado
@to-do
Escenario: borrar premio
  Dado existe una Organización llamada "ACME" con domicilio en "Av. Siempre Viva 742"
  Y que estoy en la pantalla de Administración de Organizaciones
  Cuando hago click en Borrar para "ACME"
  Entonces se borra la Organización "ACME"


























# IceBox
# Borrar desde otro lugar?
# Un usuario solo puede borrar sus propios procesos.

# Testear la ventana de confirmación:
#  Y me muestra una pantalla de confirmación

# Mensaje la organización fue borrado.

