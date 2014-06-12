# language: es
Característica: listar categorias
  Con la finalidad de poder ver todos las categorias del sistema
  como una categoria administrador
  Quiero poder ver un listado de las categorias, junto con los links para editarlos o borrarlos.
#Ejemplo de datos:
#    | Nombre         | Descripción | Nro. de Plazas | 
#    | Mejor Actor    | prueba      | 5      | 
#    | Mejor Director | prueba      | 5      | 

#Camino feliz
Escenario: listar una categoria
  Dado que he creado 1 cateogria:
    | name         | description | bench | selection_process_id |
    | Mejor Actor  | prueba      | 5     | 1                    |     
  Y que estoy en la pantalla de "administración de Categorías"
  Entonces veo una lista de las categorias con 1 de ellos.

Escenario: más de una categoria
  Dado que he creado 2 cateogria:
    | name           | description | bench | selection_process_id |
    | Mejor Actor    | prueba      | 5     | 1                    |  
    | Mejor Director | prueba      | 5     | 1                    |
  Y que estoy en la pantalla de "administración de Categorías"
  Entonces veo una lista de las categorias con 2 de ellos.

Escenario: tiene el mismo contenido
  Dado que he creado 2 cateogria:
    | name           | description | bench | selection_process_id |
    | Mejor Actor    | prueba      | 5     | 1                    |  
    | Mejor Director | prueba      | 5     | 1                    |
  Y que estoy en la pantalla de "administración de Categorías"
  Entonces veo una lista con exactamente la información de los 2 categorias.
    | Nombre         | Descripción | Nro. de Plazas |
    | Mejor Actor    | prueba      | 5              | 
    | Mejor Director | prueba      | 5              | 

#Casos Extremos.
Escenario: no tiene categorias creadas.
  Dado que no he creado ningúna cateogria
  Y que estoy en la pantalla de "administración de Categorías"
  Entonces veo una una tabla vacia, con el mensaje "Ud. no tiene registros creados."