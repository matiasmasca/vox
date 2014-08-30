class VoterList < ActiveRecord::Base
  belongs_to :selection_process, autosave: true
  has_many :user, autosave: true

  def search_voter(email)
  	@user = User.find_by_email(email)
  end
  
end
