class Donation < ApplicationRecord
  belongs_to :receiver

  validates :receiver, presence: true
  validates :amount_in_cents, comparison: { greater_than: 0 }

  include AASM

  aasm timestamps: true do
    state :created, initial: true
    state :confirmed
    state :failed
    state :revoked

    event :confirm do
      transitions from: :created, to: :confirmed
    end

    event :fail do
      transitions from: :created, to: :failed
    end

    event :revoke do
      transitions from: :confirmed, to: :revoked
    end
  end
end
