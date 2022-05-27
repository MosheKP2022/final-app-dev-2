class LabeledOffering < ApplicationRecord
  belongs_to :offering
  belongs_to :tag
end
