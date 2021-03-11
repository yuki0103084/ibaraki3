class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :articles, dependent: :destroy
  has_many :comments  
  has_many :likes
  def liked_by?(article_id)
    likes.where(article_id: article_id).exists?
  end
  
  validates :username, presence: true
end
