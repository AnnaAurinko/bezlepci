class Place < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates_presence_of :name, :address

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

end
