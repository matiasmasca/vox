# language: es
Característica: borrar un candidato
  Con la finalidad de borrar un candidato que ya no participará
  como un usuario administrador
  Quiero poder eliminar un candidato de una categoría del sistema
Antecedentes:
  Dado que estoy logueado como "Administrador"
#Camino feliz
# Borrar desde listado
Escenario: borrar categoría

  Dado existe un candidato llamado "Pepe Argento"
  Y que estoy en la pantalla de "administración de Candidatos"
  Cuando hago click en "Eliminar", para eliminar el candidato
  Entonces se borra el candidato "Pepe Argento"

# IceBox
# - Borrar desde otro lugar?
# - Chequear Un usuario solo puede borrar sus propios procesos.
# - Testear la ventana de confirmación:
#  Y me muestra una pantalla de confirmación
# - Mostrar mensaje el candidato fue borrado correctamente.
