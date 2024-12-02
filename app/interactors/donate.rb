class Donate
  def call(receiver_id, amount_in_cents)
    donation = Donation.new(
      receiver: Receiver.find(receiver_id),
      amount_in_cents:
    )
    # payment = Payment.new()
    Donation.transaction do
      donation.save
      # payment.save
    end

    return donation if donation.persisted?
    nil
  end
end
