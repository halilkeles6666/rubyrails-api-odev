class Book < ApplicationRecord
  belongs_to :genre
  belongs_to :author
  has_many :reviews
end
