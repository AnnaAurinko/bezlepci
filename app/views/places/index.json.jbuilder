json.array!(@places) do |place|
  json.extract! place, :id, :name, :specification, :address, :description, :rating, :comment_id, :user_id
  json.url place_url(place, format: :json)
end
