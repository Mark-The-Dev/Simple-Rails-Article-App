module Visible
  
  # allows methods to be called at the class level
  extend ActiveSupport::Concern

  # Validates article status
  VALID_STATUSES = ['public', 'private', 'archived']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  # counter
  class_methods do
    def public_count
      where(status: 'public').count
    end
  end
  
  
  def archived?
    status == 'archived'
  end
end