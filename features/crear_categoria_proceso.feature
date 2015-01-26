# language: es
Característica: crear una categoría para un premio.
  Con la finalidad de agrupar los candidatos en n-tuplas, para su posterior elección, a petición de algun usuario en particular.
  Como usuario administrador
  Quiero poder crear categorías para cualquier proceso de selección en el sistema.

Antecedentes:
  Dado que estoy logueado como "Administrador"
  Dado que estoy en la pantalla de administración y hago click en "Agregar Categoría" 
  Y existe un premio llamado "Premios ACME" que se realizara en "Av. Siempre Viva 742"

# Camino feliz.
Escenario: crear categoría.
  Dado que estoy en la pantalla de administración y hago click en "Agregar Categoría"
  Y completo los datos de la categoría con "Nombre C", "Una descripción", "3", "1"
  Cuando presiono el botón "Guardar Cambios"
  Entonces se crea la categoría y me muestra el mensaje "Categoría creada correctamente."
  Y me muestra los datos de la categoría recién creada

# Casos extremos.
Esquema del escenario: faltan datos
  # s/ PO obligatorios son: id, nombre y bench.
  Y completo los datos de la categoría con "<name>", "<description>", "<bench>", "<selection_process_id>"
  Cuando presiono el botón "Guardar Cambios"
  Entonces me muestra el mensaje de error que "faltan datos."

  Ejemplos: faltan datos
    | name | description | bench | selection_process_id |
    |      | prueba      | 5     | 1                    |
    | name | prueba      |       | 1                    |
    | name | prueba      | 5     |                      |

  Ejemplos: tipo de dato erroneo
    | name   | description   | bench | selection_process_id |  
    | nombre | es una prueba | A     | 1                    |
    | nombre | es una prueba | 5     | A                    |

# Datos cortos.
# s/ PO longitudes mínimas
# - id 1 int, solo numeros.
# - nombre: 5 letras.
# - Descripción: blank o 5.
# - Plaza (bench): numero de 1 digito entero, mayor que 0.
  Ejemplos: datos cortos
    | name   | description | bench  | selection_process_id |
    | Nomb   | prueba      | 5      | 1                    |
    | Nombre | prue        | 5      | 1                    |
    | Nombre | prueba      | 0      | 1                    |
    | Nombre | prueba      | 5      | 0                    |

# Datos largos.
# s/ PO longitudes máximas
# - id 1 int, solo numeros. (16 digitos maximo)
# - nombre: 255 (varchar)
# - Descripción: sin limite. [En postgresql es posible no tener limites en text ]
# - Plaza: numero 3 digitos, 999.
  Ejemplos: datos largos
    | name   | description | bench  | selection_process_id |
    | 251CARACTERESAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA   | prueba      | 5      | 1                    |
    | Nombre | descripción | 1000   | 1                    |  
    | Nombre | descripción | 5      | 9223372036854775809    | 

Escenario: nombre de categoría debe ser unico para el proceso.
  Y completo los datos de la categoría con "Nombre C", "Una descripción", "3", "1"
  Pero como ya existe una categoría con ese nombre "Nombre C"
  Cuando presiono el botón "Guardar Cambios"
  Entonces me muestra el mensaje de error que "ese nombre ya está siendo utilizado."