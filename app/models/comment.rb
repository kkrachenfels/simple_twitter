class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user

    validates :body, presence: true, length: {minimum: 10}
    validate :no_election_influence

    private
  
    def no_election_influence
      if body&.match?(/trump|harris/i)
        errors.add(:base, "Comments cannot contain references to political figures like Trump or Harris. Keep it neutral!")
      end
    end
end
