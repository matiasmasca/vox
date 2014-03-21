# language: es
Característica: crear un entidad organizadora
  Con la finalidad de poder crear procesos de elección asociados a un organizador
  como un usuario administrador
  Quiero poder crear una organización en el sistema

#Camino feliz

Escenario: crear organización
  Dado que estoy en la pantalla de administración y hago click en "Registrar Organización"
  Y completo los datos de la organización: Nombre, Dirección, Sitio Web, email
  Cuando presiono el boton "Crear"
  Entonces se crea la organización y me muestra el mensaje "Organización dada de alta correctamente."
  Y me muestra los datos recien creados

#Casos Extremos.
@wip
Escenario: crear organización con foto
#  Y subo una imagen que se utilizará como logo de la organización.
#  Y me muestra los datos recien creados junto a la imagen
