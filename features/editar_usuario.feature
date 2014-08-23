# language: es
Característica: editar un Usuario
  Con la finalidad de poder modificar directamente los datos de un Usuario, cuando sea solicitado.
  Como un usuario administrador
  Quiero poder editar un Usuario en el sistema

Antecedentes:
  Dado que estoy logueado como "Administrador"
  Y existe un Usuario: "pepeargento", "pepe@argentos.com.ar", "sevieneeltiburon" y "3"
  Y que estoy en la pantalla de "administración de Usuarios"
  Cuando yo edito un Usuario 

#Camino feliz
Escenario: editar un Usuario 
  Y cambio el nombre por "moniargento", el correo electrónico por "moni@argentos.com.ar"
  Entonces veo que el nombre cambio y el correo electrónico cambio.

Escenario: agrego dato que faltaba
  Dado existe un Usuario llamado "pepeargento" con correo electrónico en "pepe@argento.com.ar", sin nombre y apellido definido
  Y que estoy en la pantalla de "administración de Usuarios"
  Cuando yo edito un Usuario
  Y cambio el nombre por "Monica" y el apellido por "de Argento"
  Entonces veo que el nombre y apellido cambio, sin afectar a nombre de usuario o el correo electrónico.

#Casos extremos
Esquema del escenario: problemas con datos obligatorios
  Y modifico "<usuario>", "<email>", "<password>" y "<tipo>"  
  Entonces me muestra el mensaje de error que "faltan o estan mal esos datos"

  Ejemplos: faltan datos obligatorios
   | usuario 	   | email               | password   | tipo        | 
   |         	   | pepe@argento.com.ar | clave12345 | Organizador |
   | pepeargento |                     | clave12345 | Organizador |
  
  Ejemplos: datos obligatorios muy cortos
   | usuario 	   | email               | password   | tipo        | 
   | pepearg     | pepe@argento.com.ar | clave12345 | Organizador | 
   | pepeargento | @g.ws               | clave12345 | Organizador |
   | pepeargento | pepe@argento.com.ar | 1234567    | Organizador |

#Cuales son las longitudes minimas y maximas? el PO, dijo que:
#- usuario: 8 chr ~ 110
#- nombre: 2 chr ~ 110, allow blank
#- apellido: 2 chr ~ 110, allow blank
#- email: 6 chr ~ 110
#- clave: 9 chr ~ 110
#- facebook: 2 chr ~ 110, allow blank
#- twitter: 2 chr ~ 15, allow blank (incluido el arroba)
#- tipo_usuario_id: 1 (por ahora solo habrá 3 tipos de usuarios: 1,2,3)

Esquema del escenario: problemas con datos no-obligatorios
  Y modifico datos "<nombre>", "<apellido>", "<facebook>" y "<twitter>"  
  Entonces me muestra el mensaje de error que "estan mal esos datos"

  Ejemplos: datos muy cortos
   | nombre | apellido | facebook   						   | twitter | 
   | p      | Argento  | https://www.facebook.com/Comunidadtic | @pepe   | 
   | pepe   | A        | https://www.facebook.com/Comunidadtic | @pepe   |
   | pepe   | Argento  | h                                     | @pepe   |
   | pepe   | Argento  | https://www.facebook.com/Comunidadtic | @       |

# PO: las longitudes maximas, se limitan desde el formulario, con length.

Escenario: nombre unico
  Dado existe un Usuario: "kakaroto", "kakaroto@saiyajin.com.ar", "bulmabulma" y "3"
  Y existe un Usuario: "pepeargentino", "pepito@argentos.com.ar", "sevieneeltiburon" y "3"
  Y que estoy en la pantalla de "administración de Usuarios"
  Cuando yo edito el "cuarto" Usuario
  Y modifico "kakaroto", "pepe@argentos.com.ar", "sevieneeltiburon" y "Organizador" 
  Entonces me muestra el mensaje de error que "ese nombre ya está siendo utilizado"

  @to-do
Escenario: agregar imagen que faltaba