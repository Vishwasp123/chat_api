class Chat < ApplicationRecord
	has_many :messges, dependent: :destroy
	has_and_belongs_to_many :users
end
