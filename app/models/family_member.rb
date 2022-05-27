# == Schema Information
#
# Table name: family_members
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  kid_id     :bigint           not null
#  parent_id  :bigint           not null
#
# Indexes
#
#  index_family_members_on_kid_id     (kid_id)
#  index_family_members_on_parent_id  (parent_id)
#
# Foreign Keys
#
#  fk_rails_...  (kid_id => kids.id)
#  fk_rails_...  (parent_id => users.id)
#
class FamilyMember < ApplicationRecord
  belongs_to :parent, class_name: "User"
  belongs_to :kid
end
