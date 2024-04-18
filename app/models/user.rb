class User < ApplicationRecord
	has_many :messges
	has_and_belongs_to_many :chats
end
