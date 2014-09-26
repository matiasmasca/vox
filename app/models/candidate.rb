# encoding: utf-8
class Candidate < ActiveRecord::Base
	 belongs_to :category, autosave: true

   #obligatoriedad
	 validates :name, presence: { message: "es un dato obligatorio."}
   #Longitudes.
   validates :name, length: { in: 2..110, message: "debe tener entre 4 y 110 caracteres" }
   validates :bios, length: { minimum: 5, message: "debe tener más de 5 caracteres" }, :allow_blank => true
   validates :category_id, numericality: { only_integer: true, greater_than: 0, less_than: 9223372036854775808, message: "debe ser entero y mayor que 0" }

   #Nombre Unico.
   validates :name, uniqueness: { scope: :category_id, message: "ese nombre ya está siendo utilizado." }

   #Controlar Candidatos por Categoria.
   #TO-DO: si el count de candidatos = bench de la categoria, tiene que dar un error de que ya esta completo el cupo.


   #Gestión de avatars de candidatos.
   AVATAR = File.join Rails.root, 'public','images','uploads', 'avatars', 'candidatos'

   after_save :guardar_imagen


   #TO-DO: refactorizar para cumplir con DRY
   def avatar_file=(file_data)
    unless file_data.blank?
      #Extension nombre original del archivo.
      extension = file_data.original_filename.split('.').last.downcase
      @file_data = file_data
      #extension = "nombre.jpg".split('.').last.downcase
      self.url_image = extension
      #puts("MODEL-image: #{self.inspect}")
    end
  end

  def imagen_filename
    File.join AVATAR, "#{self.id}.#{self.url_image}"
  end

  def image_path
    #Ojo que usas image_tag, entonces busca en Public
    if self.url_image
       "/images/uploads/avatars/candidatos/#{self.id}.#{self.url_image}"
     else
       "/images/uploads/avatars/candidatos/avatar-generico.png" #nil
    end
  end

  def has_url_image?
    File.exists? imagen_filename
  end

  private
  def guardar_imagen
    logger.debug ("AVATAR es: #{AVATAR}")
    #@to-do: borrar imagen anterior.
  	if @file_data
  		#FileUtils.mkdir_p AVATAR
  		Dir.mkdir AVATAR unless File.directory? AVATAR
  		File.open(imagen_filename, 'wb') do |f|
  			f.write(@file_data.read)
  		end
  		@file_data = nil
  	end
  end
end
