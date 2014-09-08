class EmittedVote < ActiveRecord::Base
  belongs_to :category
  belongs_to :candidate

end
