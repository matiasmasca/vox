class Ballot < ActiveRecord::Base
  belongs_to :selection_process
  belongs_to :category
  belongs_to :candidate
end
