class VoterList < ActiveRecord::Base
  belongs_to :selection_process, autosave: true
  has_many :user, autosave: true

end
