# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable , :registerable ,
         :recoverable , :rememberable , :trackable , :validatable , :omniauthable

  # Asociaciones
  has_one :organizer , dependent: :nullify , autosave: true
  has_many :voter_list , autosave: true

  # obligatorios: usuario, email, clave, tipo_usuario_id.
  # clave pasa a llamarse encrypted_password y es controlada por la gema Devise.
  validates :usuario , :email , :tipo_usuario_id , presence: { message: 'es un dato obligatorio.'}

  # Cuales son las longitudes minimas y maximas? el PO, dijo que:
  # - usuario: 8 chr ~ 110
  # - nombre: 2 chr ~ 110, allow blank
  # - apellido: 2 chr ~ 110, allow blank
  # - email: 6 chr ~ 110
  # - clave: 9 chr ~ 110
  # - facebook: 2 chr ~ 110, allow blank
  # - twitter: 2 chr ~ 15, allow blank (incluido el arroba)
  # - tipo_usuario_id: 1 (por ahora solo habrá 3 tipos de usuarios: 1,2,3)
  validates :usuario , length: { in: 8..110 , message: 'debe ser entre 9 y 110 caracteres' }
  validates :nombre , :apellido, :facebook , length: { in: 2..110 , message: 'debe ser entre 2 y 110 caracteres' } , :allow_blank => true
  validates :email , length: { in: 6..110 , message: 'debe ser entre 5 y 110 caracteres' }

  # Mensaje de error personalizado, value.length se genera de forma dinamica. Podría mejorarse creando un validador en lib/initializer/validator.rb
  # Clave, pasa a controlarse por Devise.
  # validates :clave, length: {
  #  in: 9..128,
  #  too_short: proc { |p, v| 'es muy corta, la longitud mínima es #{v[:count]}, usted ingreso #{v[:value].length} caracteres.' },
  #  too_long:  proc { |p, v| 'es muy larga, la longitud máxima es #{v[:count]}, usted ingreso #{v[:value].length} caracteres.' }
  # }, :allow_blank => true

  validates :twitter , length: { in: 2..15 , message: ', debe ser entre 2 y 15 caracteres' } , :allow_blank => true
  validates :tipo_usuario_id , inclusion: { in: 1..3 , message: 'debe ser 1, 2 o 3' } , numericality: { only_integer: true }

  # Datos unicos.
  validates :usuario , :email , uniqueness: { message: 'ya está siendo utilizado.' , :case_sensitive => false }

  # Formato email valido
  validates :email , format: { with: /\A[\w+\-.]+@[a-z\d\-.]{2,}+\.[a-z]{2,3}\Z/i , message: '(dirección de correo electrónico) es invalido.' }
  # \A inicio con cadena.
  # [\w+\-.] caracter de palabra, un guio o un punto.
  # @ un arroba
  # [a-z\d\-.] almenos una letra, un guion
  # {2,} minimo 2 caracteres.
  # \. que haya al menos 1 punto '.'
  # [a-z]{2,3} que haya entre 2 y 3 letras seguidas: ar, com, etc.
  # /i pueden ser letras mayusculas o minusculas.

  # def mi_oganizacion
  #    Organizer.where('user_id = ?', self.id).first
  # end
  def is_admin?
      self.tipo_usuario_id == 1
  end

  def is_jury?
      self.tipo_usuario_id == 2
  end

  def is_organizer?
      self.tipo_usuario_id == 3
  end

  def self.search_by_email(query)
      where('email like ?', "%#{query}%")
  end

  def password_required? #Para que no pida pass si viene de autenticacion externa.
    super && provider.blank?
  end

 private
  def self.process_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
      # Twitter.
      if auth.provider == 'twitter'
        user.usuario = auth.info.nickname
        user.nombre = auth.info.name.split[0]
        user.apellido = auth.info.name.split[1]
        user.twitter = auth.info.nickname 
      end  
      
      # Facebook
      if auth.provider == 'facebook'
        user.usuario = auth.info.first_name + auth.info.last_name
        user.email = auth.info.email
        user.nombre = auth.info.first_name
        user.apellido = auth.info.last_name
        user.facebook = auth.info.urls['Facebook']
      end
     end
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes'] , without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def update_with_password(params, *options)
    if encrypted_password.blank? && provider.present?
      update_attributes(params, *options)
    else
      super
    end
  end
end