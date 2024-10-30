class User < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :posts, dependent: :destroy

    validates :name, presence: true, uniqueness: true
end
