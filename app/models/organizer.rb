# encoding: utf-8
class Organizer < ActiveRecord::Base
  #Asociaciones
  belongs_to :user
  has_many :selection_process, dependent: :nullify
  
  #debe borrar todo los procesos asociados con :dependent=> :delete_all
  
  LOGOS = File.join Rails.root, 'public','images','uploads', 'isologos'

  validates :name, :address, :email, presence: { message: "es un dato obligatorio."}
  validates :name, length: { in: 2..250, message: "debe ser entre 2 y 250 caracteres" }
  validates :address, :email, length: { in: 8..250, message: "debe ser entre 8 y 250 caracteres" } 
  validates :web, length: { in: 4..250, message: ", ingresó %{count} caracteres, pero debe ser entre 4 y 250 caracteres" }, :allow_blank => true
  validates :name, uniqueness: { message: "ya está siendo utilizado.", :case_sensitive => false }

  #Gestión de Logo de la Organización.
  after_save :guardar_imagen
  
  def image=(file_data)
    unless file_data.blank?
      #Extension nombre original del archivo.
      extension = file_data.original_filename.split('.').last.downcase
      @file_data = file_data
      #extension = "nombre.jpg".split('.').last.downcase
      self.logo = extension
      #puts("MODEL-image: #{self.inspect}") 
    end    
  end

  def logo_filename
    File.join LOGOS, "#{self.id}.#{self.logo}"
  end

  def image_path
    #Ojo que usas image_tag, entonces busca en Public
    if self.logo
       "/images/uploads/isologos/#{self.id}.#{self.logo}"
     else
       "/images/uploads/isologos/escudo-generico.jpg" #nil
    end
  end

  def has_logo?
    File.exists? logo_filename
  end

  private
  def guardar_imagen
    #logger.debug ("LOGOS es: #{LOGOS}")
    #@to-do: borrar imagen anterior. 
  	if @file_data
  		#FileUtils.mkdir_p LOGOS
  		Dir.mkdir LOGOS unless File.directory? LOGOS
  		File.open(logo_filename, 'wb') do |f|
  			f.write(@file_data.read)
  		end
  		@file_data = nil
  	end
  end

end

  #
  # Set the filename for versioned files
  #def filename
  #  random_token = Digest::SHA2.hexdigest("#{Time.now.utc}--#{model.id.to_s}").first(20)
  #  ivar = "@#{mounted_as}_secure_token"    
  #  token = model.instance_variable_get(ivar)
  #  token ||= model.instance_variable_set(ivar, random_token)
  #  "#{model.id}_#{token}.jpg" if original_filename
  #end