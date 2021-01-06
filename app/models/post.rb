class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :favorites,dependent: :destroy

  with_options presence: true do
    validates :title, length: {maximum: 50, message: "は50文字以内で入力してください"}
    validates :text, length: {maximum: 200, message: "は200文字以内で入力してください"}
    validates :image
  end
end
