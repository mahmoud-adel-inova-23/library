class NotificationSerializer
  include JSONAPI::Serializer
  attributes :message do |notification|
    notification.to_notification.message
  end
end
