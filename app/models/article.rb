class Article < ApplicationRecord
 
   ## sets valid statuses constant values. Made in concern
   include Visible
 
  # sets one to many, can access with @article.comments
  has_many :comments

  # validates title exists, and body is atleast 10 chars
  # Active Record automatically defines model attributes for every table column
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }


 
end
