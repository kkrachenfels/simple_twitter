class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :user

    validates :title, presence: true
    validates :body, presence: true, length: {minimum: 10}
    validate :no_election_influence

    private
  
    def no_election_influence
      if title&.match?(/trump|harris/i) || body&.match?(/trump|harris/i)
        errors.add(:base, "Posts cannot contain references to political figures like Trump or Harris. Keep it neutral!")
      end
    end
end
