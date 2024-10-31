class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user

    validates :body, presence: true, length: {minimum: 10}
    validate :no_election_influence

    private
  
    def no_election_influence
        Rails.logger.debug "Checking for restricted words in comment body..."
      if body&.match?(/trump|harris/i)
        Rails.logger.debug "Restricted word found in comment body."
        errors.add(:base, "Comments cannot contain references to political figures like Trump or Harris. Keep it neutral!")
      end
    end
end
