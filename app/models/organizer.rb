class Organizer < ActiveRecord::Base
  LOGOS = File.join Rails.root, 'public','images','uploads', 'isologos'

  after_save :guardar_imagen
  
  def image=(file_data)
    unless file_data.blank?
      #Extension nombre original del archivo.
      extension = file_data.original_filename.split('.').last.downcase
      @file_data = file_data
      #extension = "nombre.jpg".split('.').last.downcase
      self.logo = extension
    end    
  end

  def logo_filename
    File.join LOGOS, "#{self.id}.#{self.logo}"
  end

  def image_path
    #Ojo que usas image_tag, entonces busca en Public
    "/images/uploads/isologos/#{self.id}.#{self.logo}"
  end

  def has_logo?
    File.exists? logo_filename
  end

  private
  def guardar_imagen
    #logger.debug ("LOGOS es: #{LOGOS}")
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
