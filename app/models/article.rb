class Article < ApplicationRecord
  # sets one to many, can access with @article.comments
  has_many :comments

  # validates title exists, and body is atleast 10 chars
  # Active Record automatically defines model attributes for every table column
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }


  ## sets valid statuses constant values.
  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end
