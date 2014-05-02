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

Escenario: más de un proceso, mantien el contenido de cada uno
  Dado que he creado 2 organizaciones:
   | name | address                 | web			     | email			      | 
   | ACME | Av. Siempre Viva 742    | www.acme.org | contact@acme.org |
   | MECA | Av. Siempre Zombies 742 | www.meca.org | contact@meca.org |
  Y que estoy en la pantalla de Administración de Organizaciones
  Entonces veo una lista con exactamente la información de las 2 Organizaciones.
   | Nombre Organización | Domicilio 			         | Sitio web 	  | Correo electrónico |  
   | ACME 				       | Av. Siempre Viva 742    | www.acme.org | contact@acme.org 	 |
   | MECA                | Av. Siempre Zombies 742 | www.meca.org | contact@meca.org   |

#Casos Extremos.
Escenario: no tiene procesos creados.
  Dado que no he creado ningúna Organización
  Y que estoy en la pantalla de Administración de Organizaciones
  Entonces veo una una tabla vacia, con el mensaje "Ud. no tiene registros creados."

