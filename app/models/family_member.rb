class FamilyMember < ApplicationRecord
  belongs_to :parent_id
  belongs_to :kid_id
end
