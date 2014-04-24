# encoding: utf-8
class User < ActiveRecord::Base
  #obligatorios: usuario, email, clave, tipo_usuario_id. 
	validates :usuario, :email, :clave, :tipo_usuario_id, presence: { message: "es un dato obligatorio."}

  #Cuales son las longitudes minimas y maximas? el PO, dijo que:
  #- usuario: 8 chr ~ 110
  #- nombre: 2 chr ~ 110, allow blank
  #- apellido: 2 chr ~ 110, allow blank
  #- email: 5 chr ~ 110
  #- clave: 9 chr ~ 110
  #- facebook: 2 chr ~ 110, allow blank
  #- twitter: 2 chr ~ 15, allow blank (incluido el arroba)
  #- tipo_usuario_id: 1 (por ahora solo habrá 3 tipos de usuarios: 1,2,3)
  validates :usuario, length: { in: 8..110, message: ", ingresó %{count} caracteres, pero debe ser entre 8 y 110 caracteres" }
  validates :nombre, :apellido, :facebook, length: { in: 2..110, message: ", ingresó %{count} caracteres, pero debe ser entre 2 y 110 caracteres" }, :allow_blank => true
  validates :email, length: { in: 5..110, message: ", ingresó %{count} caracteres, pero debe ser entre 5 y 110 caracteres" }
  validates :clave, length: { in: 9..110, message: ", ingresó %{count} caracteres, pero debe ser entre 9 y 110 caracteres" }
  validates :twitter, length: { in: 2..15, message: ", ingresó %{count} caracteres, pero debe ser entre 2 y 15 caracteres" }, :allow_blank => true
  validates :tipo_usuario_id, inclusion: { in: 1..3, message: "%{value} debe ser 1, 2 o 3" }, numericality: { only_integer: true }

  #datos unicos.
  validates :usuario, :email, uniqueness: { message: "ya está siendo utilizado.", :case_sensitive => false }
  #formato email valido
  validates :email, format: /@/
end
