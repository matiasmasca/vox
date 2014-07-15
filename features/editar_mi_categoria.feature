# language: es
Característica: editar una Categoría
  Con la finalidad de poder modificar directamente los datos de una Categoría, cuando sea solicitado.
  Como un usuario Organizador
  Quiero poder editar una Categoría de un proceso de mi organización

Antecedentes:
  Dado existe un premio llamado "Premios ACME" que se realizara en "Av. Siempre Viva 742" 
  Y que existe una Categoría con: "Categoría A", "Una descripción", "3", "1"
  Y que estoy en la pantalla de "administración de Categorías"
  Cuando yo edito una Categoría 

#Camino feliz
Escenario: editar una Categoría
  Y cambio el nombre por "otra Categoría", el nro. de plazas por "5"
  Entonces veo que el nombre cambio y el nro. de plazas cambio.

Escenario: agrego dato que faltaba
  Dado que existe una Categoría llamada "Mejor Categoría" con "3" plazas, sin descripción definida
  Y que estoy en la pantalla de "administración de Categorías"
  Cuando yo edito una Categoría
  Y cambio la descripción por "Premia  a las mejores Categorías del año"
  Entonces veo que la descripción cambio, sin afectar al nombre de usuario o la cantidad de plazas.

#Casos extremos
Esquema del escenario: problemas con datos
  Y modifico de la categoría los datos "<name>", "<description>", "<bench>" y "<selection_process_id>"  
  Entonces me muestra el mensaje de error que "faltan o están mal esos datos"

  Ejemplos: faltan datos obligatorios
    | name | description | bench | selection_process_id |
    |      | prueba      | 5     | 1                    |
    | name | prueba      |       | 1                    |
    | name | prueba      | 5     |                      |
  
  Ejemplos: datos cortos
    | name   | description | bench  | selection_process_id |
    | Nomb   | prueba      | 5      | 1                    |
    | Nombre | prue        | 5      | 1                    |
    | Nombre | prueba      | 0      | 1                    |
    | Nombre | prueba      | 5      | 0                    |

# PO: las longitudes máximas, se limitan desde el formulario, con length.

Escenario: nombre único
  Dado que existe una Categoría con: "Categoría B", "Una descripción", "3", "1"
  #Y que existe una Categoría con: "Categoría B", "Una descripción", "3", "1"
  Y que estoy en la pantalla de "administración de Categorías"
  Cuando yo edito la 2da. Categoría
  Y modifico de la categoría los datos "Categoría A", "otra descripción", "5" y "1" 
  Entonces me muestra el mensaje de error que "ese nombre ya está siendo utilizado"