# language: es
Característica: listar categorías
  Con la finalidad de poder ver todas las categorías del sistema, ya sea para modificarlas, borrarlas o agregar nuevas.
  como un usuario administrador
  Quiero poder ver un listado de las categorías, junto con los links para editarlas o borrarlas.
#Ejemplo de datos:
#    | Nombre         | Descripción | Nro. de Plazas | 
#    | Mejor Actor    | prueba      | 5      | 
#    | Mejor Director | prueba      | 5      | 

Antecedentes:
  Dado que estoy logueado como "Administrador"

#Camino feliz
Escenario: listar una categoría
  Dado que he creado 1 categoría:
    | name         | description | bench | selection_process_id |
    | Mejor Actor  | prueba      | 5     | 1                    |     
  Y que estoy en la pantalla de "administración de Categorías"
  Entonces veo una lista de las categorías con 1 de ellos.

Escenario: más de una categoría
  Dado que he creado 2 categoría:
    | name           | description | bench | selection_process_id |
    | Mejor Actor    | prueba      | 5     | 1                    |  
    | Mejor Director | prueba      | 5     | 1                    |
  Y que estoy en la pantalla de "administración de Categorías"
  Entonces veo una lista de las categorías con 2 de ellos.

Escenario: tiene el mismo contenido
  Dado que he creado 2 categoría:
    | name           | description | bench | selection_process_id |
    | Mejor Actor    | prueba      | 5     | 1                    |  
    | Mejor Director | prueba      | 5     | 1                    |
  Y que estoy en la pantalla de "administración de Categorías"
  Entonces veo una lista con exactamente la información de los 2 categorías.
    | Nombre         | Descripción | Nro. de Plazas |
    | Mejor Actor    | prueba      | 5              | 
    | Mejor Director | prueba      | 5              | 

#Casos Extremos.
Escenario: no tiene categorías creadas.
  Dado que no he creado ningúna categoría
  Y que estoy en la pantalla de "administración de Categorías"
  Entonces veo una una tabla vacía, con el mensaje "Ud. no tiene registros creados."