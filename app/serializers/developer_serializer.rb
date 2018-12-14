class DeveloperSerializer < ActiveModel::Serializer
  attributes :id, :name, :designation, :address, :date_of_birth
end
