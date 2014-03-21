# language: es
Característica: listar Organizadores
  Con la finalidad de poder ver todos los Organizadores registrados en el sistema y acceder a diferentes acciones de administración sobre ellos
  como un usuario administrador
  Quiero poder ver un listado de todos los Organizadores

#Camino feliz
Escenario: listar un organizaciones
  Dado que he creado 1 organización:
   | name | address              | web			| email			   | 
   | ACME | Av. Siempre Viva 742 | www.acme.org | contact@acme.org |
  Y que estoy en la pantalla de Administración de Organizaciones
  Entonces veo una lista de las Organizaciones con 1 de ellas.
