# language: es
Característica: borrar una organización
  Con la finalidad de borrar una organizacion que ya no se utiliza o no tiene un administrador
  como un usuario administrador
  Quiero poder eliminar una organizacion del sistema

Antecedentes:
  Dado que estoy logueado como "Administrador"

#Camino feliz
# Borrar desde listado
Escenario: borrar organización
  Dado existe una Organización llamada "ACME" con domicilio en "Av. Siempre Viva 742" y email "info@email.com"
  Y que estoy en la pantalla de Administración de Organizaciones
  Cuando hago click en Borrar para "ACME"
  Entonces se borra la Organización "ACME"

@to-do
Escenario: borrar organización con foto
	#y borrar su imagen Avatar asociada.
	

# IceBox
# Borrar desde otro lugar?
# Un usuario solo puede borrar sus propios procesos.

# Testear la ventana de confirmación:
#  Y me muestra una pantalla de confirmación

# Mensaje la organización fue borrado.

