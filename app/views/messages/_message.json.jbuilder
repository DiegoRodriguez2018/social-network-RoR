json.extract! message, :id, :content, :references, :created_at, :updated_at
json.url message_url(message, format: :json)
