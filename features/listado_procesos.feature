# language: es
Característica: listar procesos
  Con la finalidad de poder ver todos los procesos de elección creados por mi
  como un usuario registrado de una organización
  Quiero poder ver un listado de los procesos

#Camino feliz
Escenario: listar un proceso
  Dado que he creado 1 proceso de selección:
   | name_process   | place                                 | duration| 
   | Premio Roberto | Av. Siempre Viva 742                  | 90      |
  Y que estoy en la pantalla de mis procesos electorales
  Entonces veo una lista de los procesos con 1 de ellos.

Escenario: más de un proceso
  Dado que he creado 2 proceso de selección:
   | name_process   | place                                 | duration| 
   | Premio Roberto | Av. Siempre Viva 742                  | 90      |
   | Miss Galaxia   | Planeta alfacentauris Av. Galaxy 2304 | 350     |
  Y que estoy en la pantalla de mis procesos electorales
  Entonces veo una lista de los procesos con 2 de ellos.

Escenario: tiene el mismo contenido
  Dado que he creado 2 proceso de selección:
   | name_process   | place                                 | duration| 
   | Premio Roberto | Av. Siempre Viva 742                  | 90      |
   | Miss Galaxia   | Planeta alfacentauris Av. Galaxy 2304 | 350     |
  Y que estoy en la pantalla de mis procesos electorales
  Entonces veo una lista con exactamente la información de los 2 procesos.
   | Nombre del Proceso | Lugar   | Duración | Fecha Inicio | Fecha Cierre | Tipo | Estado |  
   | Premio Roberto     | Av. Siempre Viva 742                  | 90      |||||
   | Miss Galaxia       | Planeta alfacentauris Av. Galaxy 2304 | 350     |||||

#Casos Extremos.
Escenario: no tiene procesos creados.
  Dado que no he creado ningún proceso de selección
  Y que estoy en la pantalla de mis procesos electorales
  Entonces veo una una tabla vacia, con el mensaje "Ud. no tiene registros creados."

