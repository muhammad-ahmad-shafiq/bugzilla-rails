module SerializeData
  def serialize_data(data)
    ActiveModelSerializers::SerializableResource.new(data)
  end
end