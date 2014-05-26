class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :type, :geometry, :properties
  def type
    "Feature"
  end

  def geometry
    {
      type: "Point",
      coordinates: [object.longitude, object.latitude]
    }
  end

  def properties
    {
      name: object.name,
      address: object.address,
      "marker-color" => "#BF2E57",
      "marker-symbol" => "bus",
      "marker-size" => "large"
    }
  end
end
