class DriverSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :last_name, :code

  attribute :full_name do |object|
    object.full_name
  end
end
