json.extract! filter, :id, :name, :brand, :description, :notes, :created_at, :updated_at
json.url filter_url(filter, format: :json)
