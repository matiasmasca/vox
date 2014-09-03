# encoding: utf-8
class VoterList < ActiveRecord::Base
  belongs_to :selection_process, autosave: true
  has_many :user, autosave: true

  validates :user_id, uniqueness: { scope: :selection_process_id, message: "ese usuario ya está agregado al padrón." }
  
end
