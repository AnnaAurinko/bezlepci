class Place < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  scope :waiting, ->{ where(:approved => nil) }
  scope :approved, ->{ where(:approved => true) }
  scope :rejected, ->{where(:approved => false) }

  validates_presence_of :name, :address

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  acts_as_taggable
end
