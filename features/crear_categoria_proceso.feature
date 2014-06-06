#language: es
Característica: crear una categoria para un premio.
  Con la finalidad de agrupar los candidatos en n-tuplas, para su posterior elección, a petición de algun usuario en particular.
  Como usuario administrador
  Quiero poder crear categorias para cualquier proceso de selección en el sistema.

#Camino feliz.
Escenario: crear categoria.
  Dado que estoy en la pantalla de administración y hago click en "Añadir categoria"
  Y completo los datos de la categoria con "Nombre C", "Una descripción", "3" y "1"
  Cuando presiono el botón "Guardar cambios"
  Entonces se crea la categoria y me muestra el mensaje "Categoria creada correctamente."
  Y me muestra los datos de la categoria recien creada

#Casos extremos.
# Faltan datos.
# Datos cortos.
# Datos largos.

