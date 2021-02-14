class Comment < ApplicationRecord
  
  # sets valid statuses constant values.
  include Visible
  
  # sets relational value to article table 
  belongs_to :article

  
end
