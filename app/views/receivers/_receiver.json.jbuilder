json.extract! receiver, :id, :name, :created_at, :updated_at
json.url receiver_url(receiver, format: :json)
