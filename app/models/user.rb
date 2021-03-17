class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments  
  has_many :likes
  def liked_by?(article_id)
    likes.where(article_id: article_id).exists?
  end

  def self.guest
    find_or_create_by!(username: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
  end
  end
  
  validates :username, presence: true
end
