class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :text,  presence: true,length: {maximum: 150, message:"は150字以内で入力してください"}
end
