class Tiger < ActiveRecord::Base
  belongs_to :zoo

  validates :weight, :zoo, presence: true

  # Tiger MUST have at least 100 stripes
  validates :number_of_stripes, numericality: { greater_than_or_equal_to: 100 }
end
