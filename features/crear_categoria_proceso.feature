#language: es
Característica: crear una categoria para un premio.
  Con la finalidad de agrupar los candidatos en n-tuplas, para su posterior elección, a petición de algun usuario en particular.
  Como usuario administrador
  Quiero poder crear categorias para cualquier proceso de selección en el sistema.

Antecedentes:
  Dado que estoy en la pantalla de administración y hago click en "Añadir categoria" 

#Camino feliz.
@wip
Escenario: crear categoria.
  Dado que estoy en la pantalla de administración y hago click en "Añadir categoria"
  Y completo los datos de la categoria con "Nombre C", "Una descripción", "3" y "1"
  Cuando presiono el botón "Guardar Cambios"
  Entonces se crea la categoria y me muestra el mensaje "Categoria creada correctamente."
  Y me muestra los datos de la categoria recien creada

#Casos extremos.
@wip
Esquema del escenario: faltan datos
  # s/ PO obligatorios son: id, nombre y bench.
  Y completo los datos de la categoria con "<name>", "<description>", "<bench>", "<selection_process_id>"
  Cuando presiono el botón "Guardar cambios"
  Entonces me muestra el mensaje de error que "faltan datos."

  Ejemplos: faltan datos
    | name | description | bench | selection_process_id |
    | 	   | prueba	 	 | 5	 | 1					|
    | name |  		 	 | 5	 | 1					|
    | name | prueba	 	 | 		 | 1					|
    | name | prueba	 	 | 5	 | 						|

  Ejemplos: tipo de dato erroneo
    | name | description | bench | selection_process_id |  
    | name | prueba	 	 | A	 | 1					|
    | name | prueba	 	 | 5	 | A					|

# Datos cortos.
# s/ PO longitudes mínimas
#- id 1 int, solo numeros.
#- nombre: 5 
#- Descripción: blank o 5.
#- Plaza: numero 1 digito
  Ejemplos: faltan datos
    | name  | description | bench | selection_process_id |
    | Nombr | prueba	  | 5	  | 1					 |
    | Nombre| prueb 	  | 5	  | 1					 |
    | Nombre| prueba	  | 	  | 1					 |
    | Nombre| prueba	  | 5	  | 					 |

# Datos largos.
# s/ PO longitudes máximas
#- id 1 int, solo numeros.
#- nombre: 255 
#- Descripción: lo que de xD
#- Plaza: numero 3 digitos, 999.
  Ejemplos: faltan datos
    | name | description | bench | selection_process_id |
    | 	   | prueba	 	 | 5	 | 1					|
    | name |  		 	 | 5	 | 1					|
    | name | prueba	 	 | 		 | 1					|
    | name | prueba	 	 | 5	 | 						|

