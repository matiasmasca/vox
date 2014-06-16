class Candidate < ActiveRecord::Base
	 has_and_belongs_to_many :categories

	 validates :name, :categories_id, presence: { message: "es un dato obligatorio."}

end
