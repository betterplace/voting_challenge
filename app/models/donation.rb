class Donation < ApplicationRecord
  belongs_to :receiver

  validates :receiver, presence: true
  validates :amount_in_cents, comparison: { greater_than: 0 }
end
