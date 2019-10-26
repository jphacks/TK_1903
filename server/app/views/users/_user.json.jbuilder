json.extract! user, :id, :macaddr, :zipcode, :umbrella1, :umbrella2, :created_at, :updated_at
json.url user_url(user, format: :json)
