# language: es
Característica: listar candidatos
  Con la finalidad de poder ver todos las candidatos del sistema
  como un usuario administrador
  Quiero poder ver un listado de las candidatos, junto con los links para editarlos o borrarlos.
#Ejemplo de datos:
#                           
#    | Nombre         | Bios     | Url Avatar | 
#    | Mejor Actor    | pruebas  | jpg        | 
#    | Mejor Director | pruebas  | png        | 

#Camino feliz
Escenario: listar una categoría
  Dado que he creado 1 candidato:
    | name         | bios                           | url_image | category_id |
    | Pepe Actor   | ganador de muchos premios      | jpg       |   1         |
  Y que estoy en la pantalla de "administración de Candidatos"
  Entonces veo una lista de las candidatos con 1 de ellos.

Escenario: más de una categoría
  Dado que he creado 2 candidato:
    | name         | bios                           | url_image | category_id |
    | Pepe Actor   | ganador de muchos premios      | jpg       |   1         |
    | Caro Actriz  | participo en muchas peliculas  | jpg       |   1         |   
  Y que estoy en la pantalla de "administración de Candidatos"
  Entonces veo una lista de las candidatos con 2 de ellos.

Escenario: tiene el mismo contenido
  Dado que he creado 2 candidato:
    | name         | bios                           | url_image | category_id |
    | Pepe Actor   | ganador de muchos premios      | jpg       |   1         |
    | Caro Actriz  | participo en muchas peliculas  | jpg       |   1         |   
  Y que estoy en la pantalla de "administración de Candidatos"
  Entonces veo una lista con exactamente la información de los 2 candidatos.    
    | Nombre      | Bios                         | Url Avatar                               | Cod. Categoría |
    | Pepe Actor  | ganador de muchos premios    | /images/uploads/avatars/candidatos/1.jpg |   1            |
    | Caro Actriz | participo en muchas peliculas| /images/uploads/avatars/candidatos/2.jpg |   1            |    

#Casos Extremos.
Escenario: no tiene candidatos creadas.
  Dado que no he creado ningúna candidato
  Y que estoy en la pantalla de "administración de Candidatos"
  Entonces veo una una tabla vacía, con el mensaje "Ud. no tiene registros creados."