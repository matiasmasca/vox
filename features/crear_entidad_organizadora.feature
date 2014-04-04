# language: es
Característica: crear un entidad organizadora
  Con la finalidad de poder crear procesos de elección asociados a un organizador
  como un usuario administrador
  Quiero poder crear una organización en el sistema

Antecedentes:
  Dado que estoy en la pantalla de administración y hago click en "Registrar Organización"
  Y completo los datos de la organización: Nombre, Dirección, Sitio Web, email  

#Camino feliz
Escenario: crear organización
  Cuando presiono el boton "Crear"
  Entonces se crea la organización y me muestra el mensaje "Organización dada de alta correctamente."
  Y me muestra los datos recien creados

Escenario: crear organización con foto
  Y subo una imagen que se utilizará como logo de la organización.
  Cuando presiono el boton "Crear"
  Entonces se crea la organización y me muestra el mensaje "Organización dada de alta correctamente."
  Y me muestra los datos recien creados  
  Y me muestra la imagen recién subida

#Casos Extremos.
@to-do
Escenario: si no hay foto
  #si no hay foto no tiene que mostrar nada, o una foto generica tipo silueta.

@to-do
Escenario: faltan datos obligatorios
#Cuales son obligatorios? 

@to-do
Escenario: datos muy cortos
#Cuales son los tamaños minimos y maximos.

@to-do
Escenario: archivo de foto incorrecto
# Que archivo se permitirá?
#muy grande, muy chico.
#no es una foto.
#no tiene adentro una foto, por más que tiene extensión jpg, png.

@to-do
Escenario: cambiar la imagen
#  Dado que ya tiene una imagen
#  Y quiero subir una nueva
#  Entonces le cambia el nombre a la anterior
#  Y sube actualiza a la nueva