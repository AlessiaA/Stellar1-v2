json.extract! location, :id, :name, :latitude, :longitude, :altitude, :bortle, :sqm, :created_at, :updated_at
json.url location_url(location, format: :json)
