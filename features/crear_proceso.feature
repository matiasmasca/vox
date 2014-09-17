# language: es
Característica: crear un premio
  Con la finalidad de elegir el ganador de una categoría de un proceso
  como un administrador
  Quiero poder crear un premio en el sistema

Antecedentes:
  Dado que estoy logueado como "Administrador"
  Y que estoy en la pantalla de "administración de procesos"
  Y presiono el botón "Nuevo proceso de selección"

#Camino feliz
Escenario: crear premio
  Dado existe una Organización: "Nerv Corp.", "Nueva nueva tokio", "" y "eva01@nerv.com"
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Y escribo "30" en Duracion
  Y selecciono "2014/08/13" en Fecha Inicio
  Y selecciono "2014/09/2" en Fecha Cierre
  Y en Tipo de Proceso selecciono "premio"
  Y escribo "1" en ID Organización
  Cuando presiono el botón "Guardar cambios"
  Entonces se crea el premio y me muestra el mensaje "Premio creado correctamente"

#Casos extremos
Escenario: se olvido un dato
  Y dejo en blanco Nombre
  Y dejo en blanco Lugar
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "faltan esos datos"

Escenario: datos muy cortos
  Y escribo "Prem" en Nombre
  Y escribo "Av. " en Lugar,
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "esos datos son muy cortos"

Escenario: muchos dias, más de 366.
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Y escribo "366" en Duracion
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "son muchos dias"


Escenario: dias es solo numeros
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Y escribo "366yy" en Duracion
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "dias es solo numerico"

Escenario: nombre premio repetido.
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Pero como ya existe un premio con ese nombre "Premios ACME" y lugar "Av. Siempre Viva 742"
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "el nombre del premio ya existe"

Escenario: Premio repetido, Oscar y oscar.
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Pero como ya existe un premio con ese nombre "premios acme" y lugar "Av. Siempre Viva 742"
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "el nombre del premio ya existe"

#@to-do
#Escenario: agregar imagen que faltaba

# Pasan para otra iteración.
#@to-do
#Escenario: calcula fecha cierre automaticamente
#  Dado que selecciono "2014/08/13" en Fecha Inicio
#  Y la duración es de "30" días.
#  Entonces me sugiere la fecha de cierre, autocompletando "12/09/2014" en Fecha Cierre
#@to-do
# Escenario:
# Organizador: entidad a la que pertenece el usuario. El premio debe estar asociado a la Organización a la que pertenece el usuario.

#-- Sobre este archivo.--
#Esta fue mi Primera experiencia de llevar a la practica lo estudiado sobre Cucumber y BDD sobre un caso real e independiente a los estudiadios. Son muchas las mejoras que se pueden hacer a los mismos, sobre todo DRY.

#Se modifico un poco al integrar Devise. Agregando el antecendete para quitar algunos duplicados:
#Antecedentes:
#  Dado que estoy logueado como "Administrador"
#  Y que estoy en la pantalla de "administración de procesos"
#  Y presiono el botón "Nuevo proceso de selección"