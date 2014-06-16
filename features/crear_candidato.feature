# language: es
Característica: crear un candidato para un premio.
  Con la finalidad de agregar los candidatos a las categoría, para su posterior elección, a petición de algun usuario en particular.
  Como usuario administrador
  Quiero poder crear candidatos para cualquier proceso de selección en el sistema.

Antecedentes:
  Dado que estoy en la pantalla de administración y hago click en "Agregar Candidato" 
  Y existe un premio llamado "Premios cacatua del año" que se realizara en "Av. Siempre Viva 742"
  Y que existe una Categoría con: "Categoría A", "Una descripción", "3", "1"

#Camino feliz.
Escenario: crear candidatos.
  Y completo los datos del candidato con "Nombre Candidato", "bios"
  Cuando presiono el botón "Guardar Cambios"
  Entonces se crea el candidato y me muestra el mensaje "Candidato creado correctamente."
  Y me muestra los datos del candidato recien creado

@wip
Escenario: crear candidatos con foto.
  Y completo los datos del candidato con "Nombre Candidato", "bios"
  Y subo una imagen que se utilizará como avatar del candidato.
  Cuando presiono el botón "Guardar Cambios"
  Entonces se crea el candidato y me muestra el mensaje "Candidato creado correctamente."
  Y me muestra los datos del candidato recien creado
  Y me muestra la imagen recién subida


#Casos extremos.
@wip
Escenario: crear candidatos sin foto
  #PO: si no hay foto no tiene que mostrar una foto generica tipo silueta.
  Y completo los datos del candidato con "Nombre C", "bios"
  Cuando presiono el botón "Guardar Cambios"
  Entonces se crea el candidato y me muestra el mensaje "Candidato creado correctamente."
  Y me muestra los datos del candidato recien creados
  Y me muestra la imagen de logo generica

Esquema del escenario: faltan datos
  # s/ PO obligatorios son: id, nombre y bench.
  Y completo los datos del candidato con "<name>", "<bios>"
  Cuando presiono el botón "Guardar Cambios"
  Entonces me muestra el mensaje de error que "faltan datos."

  Ejemplos: faltan datos
    | name | bios   | categories_id |
    | 	   | prueba | 1             |
    | name | prueba |               |

# Datos cortos.
# s/ PO longitudes mínimas
#- id 1 int, solo numeros.
#- nombre: 2 letras.
#- bios: blank o 5.
#- categories_id: numero de 1 digito entero, mayor que 0.
  Ejemplos: datos cortos
    | name | bios   | categories_id |
    |      | prueba |               |
    | name | prueba |               |

# Datos largos.
# s/ PO longitudes máximas
#- id 1 int, solo numeros. (16 digitos maximo)
#- name: 110 (varchar)
#- bios: sin limite. [En postgresql es posible no tener limites en text ]
#- categories_id: numero 16 digitos.
  Ejemplos: datos largos
    | name | bios   | categories_id     |
    | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA     | prueba | 1                 |
    | name | prueba | 99999999999999999 |

Escenario: nombre de candidatos debe ser unico para el proceso.
  Y completo los datos del candidato con "Nombre C", "bios"
  Pero como ya existe un candidato con ese nombre "Nombre C"
  Cuando presiono el botón "Guardar Cambios"
  Entonces me muestra el mensaje de error que "ese nombre ya está siendo utilizado."

