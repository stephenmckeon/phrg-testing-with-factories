class Zoo < ActiveRecord::Base
  belongs_to :location

  validates :location, :square_footage, presence: true

  # Must have at least 10 tons of straw
  validates :tonnage_of_straw, numericality: { greater_than_or_equal_to: 10 }

  # Must have at least 200 tons of birdfeed
  validates :tonnage_of_birdfeed, numericality: { greater_than_or_equal_to: 200 }
end
