class Tag < ApplicationRecord

  has_many :offerings, through: :labeled_offerings, source: :offering

end
