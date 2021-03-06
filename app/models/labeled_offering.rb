# == Schema Information
#
# Table name: labeled_offerings
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  offering_id :bigint           not null
#  tag_id      :bigint           not null
#
# Indexes
#
#  index_labeled_offerings_on_offering_id  (offering_id)
#  index_labeled_offerings_on_tag_id       (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (offering_id => offerings.id)
#  fk_rails_...  (tag_id => tags.id)
#
class LabeledOffering < ApplicationRecord
  belongs_to :offering, counter_cache: true
  belongs_to :tag, counter_cache: true
end
