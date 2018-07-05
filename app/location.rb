class Location < ActiveRecord::Base
  validates :city, presence: true
  validates :state, presence: true

  # Location must be in the United States
  validates :lat, inclusion: 24.7433195..49.3457868
  validates :long, inclusion: -124.7844079..-66.9513812
end