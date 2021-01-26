class Post < ApplicationRecord
  validates :bidy, length: {minimum: 1, maximum: 200}
end
