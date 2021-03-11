class Article < ApplicationRecord
    belongs_to :user
    attachment :image
    has_many :comments
    has_many :likes

    with_options presence: true do
    validates :title
    validates :body
    end
end
