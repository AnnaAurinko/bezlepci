json.array!(@actualities) do |actuality|
  json.extract! actuality, :id, :title, :body
  json.url actuality_url(actuality, format: :json)
end
