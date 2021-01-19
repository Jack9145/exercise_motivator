class Profile < ApplicationRecord
  belongs_to :user

  with_options presence:true do
    validates :height, format: {with: /\A\d{1,3}\.?\d?\z/, allow_blank: true}
    validates :weight, format: {with: /\A\d{1,3}\.?\d?\z/, allow_blank: true}
  end

  validates :fat_rate, format: {with: /\A\d{1,2}\.?\d?\z/, allow_blank: true}
    
end
