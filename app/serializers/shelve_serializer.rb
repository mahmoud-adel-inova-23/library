class ShelveSerializer
  include JSONAPI::Serializer
  attributes :name
  attribute :created_at do |record|
    record.created_at_formated
  end
end
