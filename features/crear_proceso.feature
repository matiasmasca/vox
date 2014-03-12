# language: es
Característica: crear un premio
  Con la finalidad de elegir el ganador de una categoría
  como un usuario registrado de una organización
  Quiero poder crear un premio en el sistema

#Camino feliz
Escenario: crear premio
  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Y escribo "30" en Duracion
  Y selecciono "2014/08/13" en Fecha Inicio
  Y selecciono "2014/09/2" en Fecha Cierre
  Y en Tipo de Proceso selecciono "premio"
  Cuando presiono el boton "Create Selection processes"
  Entonces se crea el premio y me muestra el mensaje "Premio creado correctamente"

#Casos extremos
Escenario: se olvido un dato
  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
  Y dejo en blanco Nombre
  Y dejo en blanco Lugar
  Cuando presiono el boton "Create Selection processes"
  Entonces me muestra el mensaje de error que "faltan esos datos"

Escenario: datos muy cortos
  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
  Y escribo "Prem" en Nombre
  Y escribo "Av. " en Lugar,
  Cuando presiono el boton "Create Selection processes"
  Entonces me muestra el mensaje de error que "esos datos son muy cortos"

Escenario: muchos dias, más de 366.
  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Y escribo "366" en Duracion
  Cuando presiono el boton "Create Selection processes"
  Entonces me muestra el mensaje de error que "son muchos dias"


Escenario: dias es solo numeros
  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Y escribo "366yy" en Duracion
  Cuando presiono el boton "Create Selection processes"
  Entonces me muestra el mensaje de error que "dias es solo numerico"

Escenario: nombre premio repetido.
  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Pero como ya existe un premio con ese nombre "Premios ACME" y lugar "Av. Siempre Viva 742"
  Cuando presiono el boton "Create Selection processes"
  Entonces me muestra el mensaje de error que "el nombre del premio ya existe"

Escenario: Premio repetido, Oscar y oscar.
  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Pero como ya existe un premio con ese nombre "premios acme" y lugar "Av. Siempre Viva 742"
  Cuando presiono el boton "Create Selection processes"
  Entonces me muestra el mensaje de error que "el nombre del premio ya existe"

# Pasan para otra iteración.
#Escenario: calcula fecha cierre automaticamente
#  Dado que selecciono "2014/08/13" en Fecha Inicio
#  Y la duración es de "30" días.
#  Entonces me sugiere la fecha de cierre, autocompletando "12/09/2014" en Fecha Cierre

# Escenario:
# Organizador: entidad a la que pertenece el usuario. El premio debe estar asociado a la Organización a la que pertenece el usuario.

#-- Sobre este archivo.--
#Esta fue mi Primera experiencia de llevar a la practica lo estudiado sobre Cucumber y BDD sobre un caso real e independiente a los estudiadios. Son muchas las mejoras que se pueden hacer a los mismos.