class Comment < ApplicationRecord
  # sets relational value to article table 
  belongs_to :article

  # sets valid statuses constant values.
  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end
