# language: es
Característica: sesión usuario
  Con la finalidad de identificarme en el sistema
  como un usuario registrado
  Quiero poder identificarme en el sistema e ingresar en el para realizar distintas tareas.

# Camino feliz
Escenario: login
    Dado que estoy en la pantalla de "Ingreso"
    Y tengo mi usuario registrado
    Y completo mi email y contraseña
    Cuando presiono el botón "Iniciar sesión"
    Entonces veo el mensaje "Ha iniciado sesión satisfactoriamente."