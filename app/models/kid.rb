# == Schema Information
#
# Table name: kids
#
#  id                   :bigint           not null, primary key
#  about_me             :text
#  dob                  :date
#  family_members_count :integer          default(0)
#  first_name           :citext
#  last_name            :citext
#  school               :citext
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Kid < ApplicationRecord

  has_many :parents, through: :family_members, source: :parent
  
  has_many :family_members, dependent: :destroy

end
