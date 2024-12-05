json.extract! donation, :id, :receiver, :amount_in_cents, :created_at, :updated_at
json.url donation_url(donation, format: :json)
