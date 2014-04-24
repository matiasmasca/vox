# language: es
Característica: crear un entidad organizadora
  Con la finalidad de poder crear procesos de elección asociados a un organizador
  como un usuario administrador
  Quiero poder crear una organización en el sistema

Antecedentes:
  Dado que estoy en la pantalla de administración y hago click en "Registrar Organización"  
  Y completo los datos de la organización con "Nombre A", "Dirección", "Sitio Web" y "contacto@email.com"

#Camino feliz
Escenario: crear organización
  Cuando presiono el botón "Crear"
  Entonces se crea la organización y me muestra el mensaje "Organización dada de alta correctamente."
  Y me muestra los datos recien creados

Escenario: crear organización con foto
  Y subo una imagen que se utilizará como logo de la organización.
  Cuando presiono el botón "Crear"
  Entonces se crea la organización y me muestra el mensaje "Organización dada de alta correctamente."
  Y me muestra los datos recien creados  
  Y me muestra la imagen recién subida

#Casos Extremos.
Esquema del escenario: problemas con datos obligatorios
  #Cuales son obligatorios? el PO, dijo que son: Nombre, Dirección y email. 
  Y completo los datos de la organización con "<name>", "<address>", "<web>" y "<email>"  
  Cuando presiono el botón "Crear"
  Entonces me muestra el mensaje de error que "faltan esos datos"

  Ejemplos: faltan datos
   | name | address              | web         | email            | 
   |      | Av. Siempre Viva 742 | www.web.com | contact@acme.org |
   | ACME |                      | www.web.com | contact@acme.org |
   | ACME | Av. Siempre Viva 742 | www.web.com |                  |
  

  Ejemplos: datos muy cortos
   | name | address              | web         | email            | 
   | A    | Av. Siempre Viva 742 | www.web.com | contact@acme.org |
   | AC   | Av. Sie              | www.web.com | contact@acme.org |
   | AC   | Av. Siempre Viva 742 | www.web.com | me@g.ws          |
   | AC   | Av. Siempre Viva 742 | .ws         | contact@acme.org |

  Ejemplos: datos muy largos
   | name                                                                                                                                                                                                                                                        | address              | web         | email            | 
   | 251CARACTERESAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA | Av. Siempre Viva 742 | www.web.com | contact@acme.org |
   | ACME  | 251CARACTERESAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA              | www.web.com | contact@acme.org |
   | AC   | Av. Siempre Viva 742 | 251CARACTERESAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA | contact@g.ws          |
   | AC   | Av. Siempre Viva 742 | www.web.com | 251CARACTERESAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA          |
 
#Cuales son los tamaños minimos y maximos? el PO, dijo que:
#   Nombre: mínimo 2, máximo 250. 
#   8 minimo y 250 máximo, address y email. 
#   Web:
#     - minimo 4
#     - 63 es lo maximo de un dominio, entre www.[63c].com. El record lo tiene un escoces de 81c.
#     - el más corto  g.cn
#     - permitir dejar en blanco

Escenario: si no hay foto
  #PO: si no hay foto no tiene que mostrar una foto generica tipo silueta.
  Y completo los datos de la organización con "Nombre B", "Dirección", "Sitio Web" y "contacto@email.com"
  Cuando presiono el botón "Crear"
  Entonces se crea la organización y me muestra el mensaje "Organización dada de alta correctamente."
  Y me muestra los datos recien creados
  Y me muestra la imagen de logo generica


@to-do
Escenario: archivo de foto incorrecto
# Que archivo se permitirá? jpg, png
#muy grande, muy chico.
#no es una foto.
#no tiene adentro una foto, por más que tiene extensión jpg, png.

@to-do
Escenario: nombre de organización unico.

#Escenario: nombre premio repetido.
#  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
#  Y escribo "Premios ACME" en Nombre
#  Y escribo "Av. Siempre Viva 742" en Lugar,
#  Pero como ya existe un premio con ese nombre "Premios ACME" y lugar "Av. Siempre Viva 742"
#  Cuando presiono el boton "Crear"
#  Entonces me muestra el mensaje de error que "el nombre del premio ya existe"

#Escenario: Premio repetido, Oscar y oscar.
#  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
#  Y escribo "Premios ACME" en Nombre
#  Y escribo "Av. Siempre Viva 742" en Lugar,
#  Pero como ya existe un premio con ese nombre "premios acme" y lugar "Av. Siempre Viva 742"
#  Cuando presiono el boton "Crear"
#  Entonces me muestra el mensaje de error que "el nombre del premio ya existe"