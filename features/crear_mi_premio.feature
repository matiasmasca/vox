# language: es
Característica: crear mi proceso de seleccion
  Con la finalidad de elegir los ganadores del proceso de selección
  como un usuario registrado de una organización
  Quiero poder crear un premio en el sistema

Antecedentes:
  Dado que estoy logueado como "Organizador"
  Y que estoy en la pantalla de "dashboard usuario" 
  Y presiono el botón "Nuevo proceso de selección" 

#Camino feliz
Escenario: crear premio
  Y completo los datos del premio
  Cuando presiono el botón "Guardar cambios"
  Entonces se crea el premio y me muestra el mensaje "Premio creado correctamente"
  Y el premio pertenece a la organización del usuario

#@to-do
# Escenario:
# Organizador: entidad a la que pertenece el usuario. El premio debe estar asociado a la Organización a la que pertenece el usuario.

#Casos extremos
Escenario: se olvido un dato
  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
  Y dejo en blanco Nombre
  Y dejo en blanco Lugar
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "faltan esos datos"

Escenario: datos muy cortos
  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
  Y escribo "Prem" en Nombre
  Y escribo "Av. " en Lugar,
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "esos datos son muy cortos"

Escenario: muchos dias, más de 366.
  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Y escribo "366" en Duracion
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "son muchos dias"


Escenario: dias es solo numeros
  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Y escribo "366yy" en Duracion
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "dias es solo numerico"

Escenario: nombre premio repetido.
  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Pero como ya existe un premio con ese nombre "Premios ACME" y lugar "Av. Siempre Viva 742"
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "el nombre del premio ya existe"

Escenario: Premio repetido, Oscar y oscar.
  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Pero como ya existe un premio con ese nombre "premios acme" y lugar "Av. Siempre Viva 742"
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "el nombre del premio ya existe"





# Pasan para otra iteración.
#@to-do
#Escenario: calcula fecha cierre automaticamente
#  Dado que selecciono "2014/08/13" en Fecha Inicio
#  Y la duración es de "30" días.
#  Entonces me sugiere la fecha de cierre, autocompletando "12/09/2014" en Fecha Cierre


