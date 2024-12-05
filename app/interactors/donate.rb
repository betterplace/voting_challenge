class Donate
  DonateResult = Data.define(:success, :donation)

  def call(receiver_id, amount_in_cents)
    donation = Donation.new(
      receiver: Receiver.find_by(id: receiver_id),
      amount_in_cents:
    )
    # payment = Payment.new()
    Donation.transaction do
      donation.save
      # payment.save
    end

    DonateResult.new(success: donation.persisted?, donation:)
  end
end
