class Bear < ActiveRecord::Base
  belongs_to :zoo

  validates :weight, :zoo, presence: true

  # Zoo only allows brown and black bears
  validates_inclusion_of :color, in: ["brown", "black"]
end