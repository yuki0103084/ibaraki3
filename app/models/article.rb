class Article < ApplicationRecord
    belongs_to :user
    attachment :image
    has_many :comments
    has_many :likes
    has_many :likes, dependent: :destroy

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category  
    validates :category_id, presence: true

    with_options presence: true do
    validates :title
    validates :body
    end
end
