# language: es
Característica: editar un candidato
	Con el objetivo de poder editar los datos de cualquier candidato para realizar correcciones o modificaciones a pedidos de los usuarios.
	Como usuario Administrador
	Quiero poder editar cualquier usuario del sistema.

Antecedentes:
	Dado existe un premio llamado "Premios ACME" que se realizara en "Av. Siempre Viva 742" 
  Y que existe una Categoría con: "Categoría A", "Una descripción", "3", "1"
	Y que existe un candidato: "Manolito", "Es un buen tipo".
	Y que estoy en la pantalla de "administración de Candidatos"
	Y que presione el botón "Editar"

#Camino Feliz
Escenario: editar candidato.
	Y modifico del candidato los datos "Pepe Argento", "" 
	Y presiono el botón "Guardar Cambios"
	Entonces veo que el "nombre" cambio.
	Y veo el mensaje "Información actualizada correctamente."

Escenario: agregar foto
	Dado que existe un candidato, sin foto.

Escenario: modificar foto
	Dado que existe un candidato, con foto.

#Casos extremos
#Casos extremos
Esquema del escenario: problemas con datos
  Y modifico del candidato los datos "<name>", "<bios>"  
  Entonces me muestra el mensaje de error que "faltan o estan mal esos datos"
  Ejemplos: faltan datos obligatorios
    | name | bios   | 
    | 	   | prueba | 
  
  Ejemplos: datos cortos
    | name 		  | bios   | 
    | F	   		  | prueba | 
    | Felipillo | pru 	 |

  # PO: las longitudes maximas, se limitan desde el formulario, con length.

Escenario: nombre unico
  Dado que existe un candidato: "Manolito", "Es un buen tipo".
  Y que estoy en la pantalla de "administración de Candidatos"
  Cuando yo edito un 2do. Candidato
  Y modifico del 2do. candidato los datos "Manolito", "es otro buen tipo" 
  Entonces me muestra el mensaje de error que "ese nombre ya está siendo utilizado"
