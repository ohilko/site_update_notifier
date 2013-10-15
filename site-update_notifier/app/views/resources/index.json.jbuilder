json.array!(@resources) do |resource|
  json.extract! resource, :url, :name, :user_id, :timeout, :change
  json.url resource_url(resource, format: :json)
end
