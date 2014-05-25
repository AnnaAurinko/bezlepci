class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :type, :geometry, :properties
  def type
    "Feature"
  end

  def geometry
    {
      type: "Point",
      coordinates: [object.latitude, object.longitude]
    }
  end

  def properties
    {
      name: object.name,
      address: object.address,
      "marker-color" => "#00607d",
      "marker-symbol" => "circle",
      "marker-size" => "medium"
    }
  end
end
