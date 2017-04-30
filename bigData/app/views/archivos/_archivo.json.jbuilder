json.extract! archivo, :id, :titulo, :autor, :body, :created_at, :updated_at
json.url archivo_url(archivo, format: :json)
