# == Schema Information
#
# Table name: tags
#
#  id                      :bigint           not null, primary key
#  labeled_offerings_count :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class Tag < ApplicationRecord

  has_many :offerings, through: :labeled_offerings, source: :offering

end
