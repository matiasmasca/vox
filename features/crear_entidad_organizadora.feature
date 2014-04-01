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

Escenario: crear organización con foto
  Dado que estoy en la pantalla de administración y hago click en "Registrar Organización"
  Y completo los datos de la organización: Nombre, Dirección, Sitio Web, email
  Y subo una imagen que se utilizará como logo de la organización.
  Cuando presiono el boton "Crear"
  Entonces se crea la organización y me muestra el mensaje "Organización dada de alta correctamente."
  Y me muestra los datos recien creados  
  Y me muestra la imagen recién subida

#Casos Extremos.
Escenario: faltan datos
#Cuales son obligatorios? 

Escenario: datos muy cortos
#Cuales son los tamaños minimos y maximos.

Escenario: archivo de foto incorrecto
# Que archivo se permitirá?
#muy grande, muy chico.
#no es una foto.
#no tiene adentro una foto, por más que tiene extensión jpg, png.
