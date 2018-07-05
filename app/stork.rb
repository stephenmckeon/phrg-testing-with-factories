class Stork < ActiveRecord::Base
  belongs_to :zoo

  validates :color, :zoo, presence: true

  # Storks must have adequate bill length and wing span,
  # but nothing too crazy
  validates :bill_length, inclusion: 3..15
  validates :wing_span, inclusion: 10..50
end
