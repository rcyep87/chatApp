json.array!(@messages) do |message|
  json.extract! message, :id, :msg, :user_id, :room_id
  json.url message_url(message, format: :json)
end
