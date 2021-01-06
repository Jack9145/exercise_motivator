class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :favorites,dependent: :destroy
  with_options presence: true do
    validates :nickname
    validates :email
    validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字を含む６文字以上で設定してください' }
  end
  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end
end
 
