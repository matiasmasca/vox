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

#Casos extremos.
Esquema del escenario: faltan datos
  # s/ PO obligatorios son: nombre, lugar
  Y completo los datos del proceso con "<name_process>", "<place>", "<duration>"
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "faltan datos."

  Ejemplos: faltan datos
    | name_process | place            | duration |
    |              | Av. Siempre Viva | 180      |
    | prueba       |                  | 360      | 

Esquema del escenario: faltan datos
  Y completo los datos del proceso con "<name_process>", "<place>", "<duration>"
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "esos datos son muy cortos"

  Ejemplos: datos muy cortos
    | name_process | place            | duration |
    | Prem         | Av. Siempre Viva | 180      |
    | prueba       |                  | 360      | 

Esquema del escenario: faltan datos
  Y completo los datos del proceso con "<name_process>", "<place>", "<duration>"
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "esos datos son muy cortos"

  Ejemplos: duración larga, corta, solo numeros.
    | name_process  | place            | duration |
    | Premio Prueba | Av. Siempre Viva | 0        |
    | Premio Prueba | Av. Siempre Viva | 366      | 
    | Premio Prueba | Av. Siempre Viva | 366      |
    | Premio Prueba | Av. Siempre Viva | 366aa    |


Escenario: nombre premio repetido.
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Pero como ya existe un premio con ese nombre "Premios ACME" y lugar "Av. Siempre Viva 742"
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "el nombre del premio ya existe"

Escenario: Premio repetido, case sensitive: Oscares y oscares.
  Y escribo "Premios ACME" en Nombre
  Y escribo "Av. Siempre Viva 742" en Lugar,
  Pero como ya existe un premio con ese nombre "premios acme" y lugar "Av. Siempre Viva 742"
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "el nombre del premio ya existe"

#Escenario: fechas seleccionadas incoherentes.
#Escenario: tipo de evento incorrecto.



# Pasan para otra iteración.
#@to-do
#Escenario: calcula fecha cierre automaticamente
#  Dado que selecciono "2014/08/13" en Fecha Inicio
#  Y la duración es de "30" días.
#  Entonces me sugiere la fecha de cierre, autocompletando "12/09/2014" en Fecha Cierre


