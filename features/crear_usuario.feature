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
  Y completo los datos del usuario con "usuario", "nombre", "apellido", "email", "clave", "facebook", "twiter" y "Organizador"

#Camino feliz
Esquema del escenario: datos usuario
  #Cual será el nombre de usuario en el sistema? Product Owner: 
  Y completo los datos del usuario con "<usuario>", "<nombre>", "<apellido>", "<email>", "<clave>", "<facebook>", "<twiter>" y "<tipo_usuario_id>"  
  Cuando presiono el botón "Crear"
  Entonces se lee el texto "Usuario registrado correctamente."

  Ejemplos: camino feliz
  | usuario     | nombre | apellido | email                         | clave   | facebook  | twiter| tipo_usuario_id |
  | pepeargento | pepe   | argento  | pepeargento@argentina.com.ar  | moni123 |           | @pepe | Organizador     |

#Casos extremos
Esquema del escenario: datos usuario
  #Cual será el nombre de usuario en el sistema? Product Owner: 
  Y completo los datos del usuario con "<usuario>", "<nombre>", "<apellido>", "<email>", "<clave>", "<facebook>", "<twiter>" y "<tipo_usuario_id>"
  Cuando presiono el botón "Crear"
  Entonces me muestra el mensaje de error que "faltan datos."

  #Cuales son obligatorios? el PO, dijo que son: Nombre, Dirección y email. 
  Ejemplos: faltan datos
  | usuario     | nombre | apellido | email                         | clave   | facebook  | twiter| tipo_usuario_id |
  |             | pepe   | argento  | pepeargento@argentina.com.ar  | moni123 |           | @pepe | Organizador     |

  Ejemplos: longitud incorrecta
  | usuario     | nombre | apellido | email                         | clave   | facebook  | twiter| tipo_usuario_id |
  | pepeargento | pepe   | argento  | pepeargento@argentina.com.ar  | moni123 |           | @pepe | Organizador     |

Escenario: crear usuario con avatar
  Y subo una imagen que se utilizará como "Avatar".
  Cuando presiono el botón "Crear"
  Entonces se crea el usuario y me muestra el mensaje "Usuario registrado correctamente."
  Y me muestra los datos recien creados  
  Y me muestra la imagen recién subida

Escenario: si no hay foto
  #PO: si no hay foto no tiene que mostrar una foto generica tipo silueta.
  Cuando presiono el botón "Crear"
  Entonces se crea el usuario y me muestra el mensaje "Usuario registrado correctamente."  
  Y me muestra los datos recien creados
  Y me muestra la imagen de "avatar generica"

#Casos extremos.
#Cuales son obligatorios? el PO, dijo que son: Nombre, clave y email. 