json.extract! donation, :id, :amount_in_cents, :created_at, :updated_at
json.url donation_url(donation, format: :json)
