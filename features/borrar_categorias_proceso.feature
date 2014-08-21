# language: es
Característica: borrar una categoría
  Con la finalidad de borrar una categoría que ya no se utiliza
  como un usuario administrador
  Quiero poder eliminar una categoría en el sistema
  
Antecedentes:
  Dado que estoy logueado como "Administrador"

#Camino feliz
# Borrar desde listado
Escenario: borrar categoría
  Dado existe una categoría llamada "Mejor director"
  Y que estoy en la pantalla de "administración de Categorías"
  Cuando hago click en "Eliminar", para eliminar la categoría
  Entonces se borra la categoría "Mejor director"

# IceBox
# Borrar desde otro lugar?
# Un usuario solo puede borrar sus propios procesos.

# Testear la ventana de confirmación:
#  Y me muestra una pantalla de confirmación

# Mensaje la organización fue borrado.
