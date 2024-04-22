class Post < ApplicationRecord
	has_many :poly_comment, as: :commentable
end
