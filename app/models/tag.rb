# == Schema Information
#
# Table name: tags
#
#  id                      :bigint           not null, primary key
#  labeled_offerings_count :integer
#  name                    :citext
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class Tag < ApplicationRecord

  has_many :labeled_offerings, dependent: :destroy

  has_many :offerings, through: :labeled_offerings

  validates :name, presence: true

end
