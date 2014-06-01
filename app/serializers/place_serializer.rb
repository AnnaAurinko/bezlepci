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
    case object.specification
    when "Pivo"
      {
      name: object.name,
      address: object.address,
      description: object.description,
      "marker-color" => "#2F7582",
      "marker-symbol" => "beer",
      "marker-size" => "medium"
      }

    when "Obchod"
        {
        name: object.name,
        address: object.address,
        description: object.description,
        "marker-color" => "#C86F73",
        "marker-symbol" => "shop",
        "marker-size" => "medium"
      }

    when "Kavarna"
        {
        name: object.name,
        address: object.address,
        description: object.description,
        "marker-color" => "#725421",
        "marker-symbol" => "cafe",
        "marker-size" => "medium"
      }

    when "Restaurace"
      {
      name: object.name,
      address: object.address,
      description: object.description,
      "marker-color" => "#717135",
      "marker-symbol" => "restaurant",
      "marker-size" => "medium"
    }

    # missing specification
    else 
     {
      name: object.name,
      address: object.address,
      description: object.description,
      "marker-color" => "#FAAD1E",
      "marker-size" => "medium"
    }
    end
  end
end
