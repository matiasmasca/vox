json.array!(@users) do |user|
  json.extract! user, :id, :usuario, :nombre, :apellido, :email, :clave, :facebook, :twitter, :tipo_usuario_id
  json.url user_url(user, format: :json)
end
