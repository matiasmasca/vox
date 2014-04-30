# language: es
Característica: crear un premio
  Con la finalidad de elegir el ganador de una categoría
  como un usuario administrador
  Quiero poder crear un usuario del sistema

#Ejemplo de datos:
#| usuario    | nombre | apellido | email							| clave 	| facebook	| twiter| tipo_usuario_id |
#|pepeargento | pepe   | argento  | pepeargento@argentina.com.ar 	| moni123 	| 			| @pepe | 1				  |

Antecedentes:
  Dado que estoy en la pantalla de administración y hago click en "Registrar Usuario"  
  Y completo los datos del usuario con "usuario01", "nombre", "apellido", "email", "clave1234", "facebook", "twiter" y "Organizador"

#Camino feliz
Esquema del escenario: datos usuario
  #Cual será el nombre de usuario en el sistema? Product Owner: un nombre de usuario o el correo
  Y completo los datos del usuario con "<usuario>", "<nombre>", "<apellido>", "<email>", "<clave>", "<facebook>", "<twiter>" y "<tipo_usuario_id>"  
  Cuando presiono el botón "Guardar cambios"
  Entonces se lee el texto "Usuario registrado correctamente."

  Ejemplos: camino feliz
    | usuario     | nombre | apellido | email                         | clave     | facebook  | twiter| tipo_usuario_id |
    | pepeargento | pepe   | argento  | pepeargento@argentina.com.ar  | moni12345 |           | @pepe | Organizador     |

  Ejemplos: tipos de usuario
    | usuario     | nombre | apellido | email                         | clave     | facebook  | twiter | tipo_usuario_id |
    | pepearge    | Li     | Zi       | li@mail.wz                         | moni12345 | myfac      | @p    | Admin           |
    | pepearge    | Li     | Zi       | li@mail.wz                         | moni12345 | myfac      | @p    | Jurado          |
    | pepearge    | Li     | Zi       | li@mail.wz                         | moni12345 | myfac      | @p    | Organizador     |

#Casos extremos
Esquema del escenario: datos usuario
  #Cual será el nombre de usuario en el sistema? Product Owner: 
  Y completo los datos del usuario con "<usuario>", "<nombre>", "<apellido>", "<email>", "<clave>", "<facebook>", "<twiter>" y "<tipo_usuario_id>"
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "faltan datos."

  #Cuales son obligatorios? el PO, dijo que son: usuario, email, clave, tipo usuario. 
  Ejemplos: faltan datos
    | usuario     | nombre | apellido | email                         | clave   | facebook    | twiter| tipo_usuario_id |
    |             | pepe   | argento  | pepeargento@argentina.com.ar  | moni123 |             | @pepe | Organizador     |
    | pepeargento | pepe   | argento  |                               | moni123 |             | @pepe | Organizador     |
    | pepeargento | pepe   | argento  | pepeargento@argentina.com.ar  |         |  myfacebook | @pepe | Organizador     |
    # Desde el punto de vista del Comportamiento, Tipo de Usuario siempre tendrá un valor ya que será un menu.

  #Cuales son las longitudes minimas y maximas? el PO, dijo que:
  #- usuario: 8 chr ~ 110
  #- nombre: 2 chr ~ 110, allow blank
  #- apellido: 2 chr ~ 110, allow blank
  #- email: 5 chr ~ 110
  #- clave: 9 chr ~ 110
  #- facebook: 2 chr ~ 110, allow blank
  #- twiter: 2 chr ~ 15, allow blank (incluido el arroba)
  #- tipo_usuario_id: 1 (por ahora solo habrá 3 tipos de usuarios: 1,2,3)
  Ejemplos: longitud minima incorrecta
    | usuario     | nombre | apellido | email                         | clave     | facebook   | twiter| tipo_usuario_id |
    | pepearg     | pepe   | argento  | pepeargento@argentina.com.ar  | moni12345 | myfacebook | @pepe | Organizador     |
    | pepearge    | 6      | argento  | pepeargento@argentina.com.ar  | moni12345 | myfacebook | @pepe | Organizador     |
    | pepearge    | Li     | Z        | pepeargento@argentina.com.ar  | moni12345 | myfacebook | @pepe | Organizador     |
    | pepearge    | Li     | Zi       | l@wz                          | moni12345 | myfacebook | @pepe | Organizador     |
    | pepearge    | Li     | Zi       | li@mail.wz                    | moni1234  | myfacebook | @pepe | Organizador     |
    | pepearge    | Li     | Zi       | li@mail.wz                    | moni12345 | m          | @pepe | Organizador     |
    | pepearge    | Li     | Zi       | li@mail.wz                    | moni12345 | myfac      | @     | Organizador     |

  # Deprecado: probar a bajo nivel, porque se impide por Vista con maxlength.
  #Ejemplos: longitud maxima incorrecta
  #  | usuario     | nombre | apellido | email                         | clave     | facebook   | twiter| tipo_usuario_id |
  #      | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA   | pepe   | argento  | pepeargento@argentina.com.ar  | moni12345 | myfacebook | @pepe | Organizador     |
  #   | pepearge    | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA      | argento  | pepeargento@argentina.com.ar  | moni12345 | myfacebook | @pepe | Organizador     |
  #  | pepearge    | Li     | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA        | pepeargento@argentina.com.ar  | moni12345 | myfacebook | @pepe | Organizador     |
  #  | pepearge    | Li     | Zi       | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA@AAA.AAA | moni12345 | myfacebook | @pepe | Organizador     |
  #  | pepearge    | Li     | Zi       | li@mail.wz                    | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA  | myfacebook | @pepe | Organizador     |
  #  | pepearge    | Li     | Zi       | li@mail.wz                    | moni12345 | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA          | @pepe | Organizador     |
  # | pepearge    | Li     | Zi       | li@mail.wz                    | moni12345 | myfac      | @1234567890123456    | Organizador     |

Escenario: nombre de usuario debe ser unico.
  Pero como ya existe un usuario con ese "nombre de usuario"
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "ese nombre de usuario ya está siendo utilizado."

Escenario: email del usuario debe ser unico.
  Pero como ya existe un usuario con ese "correo electrónico"
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "ese email ya está siendo utilizado por otro usuario."


# CASE Sensitive
#Escenario: Premio repetido, Oscar y oscar.
#  Dado que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"
#  Y escribo "Premios ACME" en Nombre
#  Y escribo "Av. Siempre Viva 742" en Lugar,
#  Pero como ya existe un premio con ese nombre "premios acme" y lugar "Av. Siempre Viva 742"
#  Cuando presiono el boton "Guardar cambios"
#  Entonces me muestra el mensaje de error que "el nombre del premio ya existe"

#@to-do para otra iteración.
#Escenario: crear usuario con avatar
#  Y subo una imagen que se utilizará como "Avatar".
#  Cuando presiono el botón "Guardar cambios"
#  Entonces se crea el usuario y me muestra el mensaje "Usuario registrado correctamente."
#  Y me muestra los datos recien creados  
#  Y me muestra la imagen recién subida

#Escenario: si no hay foto
  #PO: si no hay foto no tiene que mostrar una foto generica tipo silueta.
#  Cuando presiono el botón "Guardar cambios"
#  Entonces se crea el usuario y me muestra el mensaje "Usuario registrado correctamente."  
#  Y me muestra los datos recien creados
#  Y me muestra la imagen de "avatar generica"
