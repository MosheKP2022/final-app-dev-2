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
#  parents_count        :integer          default(0)
#  school               :citext
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Kid < ApplicationRecord
  
  has_many :family_members, dependent: :destroy

  has_many :parents, through: :family_members

  validates :dob, presence: true

  validates :first_name, presence: true

  validates :last_name, presence: true


end
