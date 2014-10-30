json.array!(@secrets) do |secret|
  json.extract! secret, :id, :text
  json.url secret_url(secret, format: :json)
end
