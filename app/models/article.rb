class Article < ApplicationRecord
  # validates title exists, and body is atleast 10 chars
  # Active Record automatically defines model attributes for every table column
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
