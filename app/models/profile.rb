class Profile < ApplicationRecord
  belongs_to :user

  with_options presence:true do
    validates :height, format: {with: /\A\d{1,3}\.?\d?\z/}
    validates :weight, format: {with: /\A\d{1,3}\.?\d?\z/}
  end

  validates :fat_rate, format: {with: /\A\d{1,2}\.?\d?\z/}
    
end
