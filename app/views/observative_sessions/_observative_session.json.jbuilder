json.extract! observative_session, :id, :user_id, :date, :name, :start, :end, :longitude, :latitude, :altitude, :bortle, :sqm, :antoniadi, :pickering, :sky_transparency, :completed, :notes, :created_at, :updated_at
json.url observative_session_url(observative_session, format: :json)