# language: es
Característica: crear una categoría para un premio.
  Con la finalidad de agrupar los candidatos en n-tuplas, para su posterior elección.
  Como usuario organizador
  Quiero poder crear categorías para un proceso de selección de mi organización.

Antecedentes:
  Dado que estoy logueado como "Organizador" 
  Dado que existe un Proceso: "Reina del Desierto", "Alguna ciudad", "15"  asociado a mi organizacion "Nerv Corp.".
  #Y que estoy en la pantalla de "Modificar Proceso" #hasta que este el diseño de pantallas.
  
  Y presiono el botón "Agregar Categoría" 

#Camino feliz.
Escenario: crear categoría.
  Y completo los datos de mi categoría con "Nombre C", "Una descripción", "3", "1"
  Cuando presiono el botón "Guardar Cambios"
  Entonces me muestra el mensaje "Categoría creada correctamente."
  Y me muestra los datos de la categoría recién creada

#Casos extremos.
Esquema del escenario: faltan datos
  # s/ PO obligatorios son: id, nombre y bench.
  Y completo los datos de la categoría con "<name>", "<description>", "<bench>", "<selection_process_id>"
  Cuando presiono el botón "Guardar Cambios"
  Entonces me muestra el mensaje de error que "faltan datos."

  Ejemplos: faltan datos
    | name | description | bench | selection_process_id |
    | 	   | prueba	 	   | 5	   | 1	           				|
    | name | prueba	 	   | 		   | 1					          |
    | name | prueba	 	   | 5	   | 						          |

  Ejemplos: tipo de dato erroneo
    | name   | description   | bench | selection_process_id |  
    | nombre | es una prueba | A	   | 1					          |
    | nombre | es una prueba | 5	   | A					          |

# Datos cortos.
# s/ PO longitudes mínimas
#- id 1 int, solo números.
#- nombre: 5 letras.
#- Descripción: blank o 5.
#- Plaza (bench): numero de 1 dígito entero, mayor que 0.
  Ejemplos: datos cortos
    | name   | description | bench  | selection_process_id |
    | Nomb   | prueba	     | 5	    | 1          					 |
    | Nombre | prue 	     | 5	    | 1          					 |
    | Nombre | prueba	     | 0	    | 1					           |
    | Nombre | prueba	     | 5	    | 0					           |

# Datos largos.
# s/ PO longitudes máximas
#- id 1 int, solo números. (16 digitos maximo)
#- nombre: 255 (varchar)
#- Descripción: sin limite. [En postgresql es posible no tener limites en text ]
#- Plaza: numero 3 dígitos, 999.
  Ejemplos: datos largos
    | name   | description | bench  | selection_process_id |
    | 251CARACTERESAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA   | prueba      | 5      | 1                    |
#   | Nombre | Acá una descripción muy larga. Hasta infinito.        | 5      | 1                    |
    | Nombre | descripción | 1000   | 1                    |  
    | Nombre | descripción | 5      | 9223372036854775809    | 

Escenario: nombre de categoría debe ser único para el proceso.
  Y completo los datos de la categoría con "Nombre C", "Una descripción", "3", "1"
  Pero como ya existe una categoría con ese nombre "Nombre C"
  Cuando presiono el botón "Guardar Cambios"
  Entonces me muestra el mensaje de error que "ese nombre ya está siendo utilizado."

Escenario: Categoría repetido, case sensitive: Mejor Actor y mejor actor.
  Y completo los datos de la categoría con "Nombre C", "Una descripción", "3", "1"
  Pero como ya existe una categoría con ese nombre "Nombre C"
  Cuando presiono el botón "Guardar Cambios"
  Entonces me muestra el mensaje de error que "ese nombre ya está siendo utilizado."
  Entonces me muestra el mensaje de error que "el nombre del premio ya existe"
