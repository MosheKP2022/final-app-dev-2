# == Schema Information
#
# Table name: saves
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  offering_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_saves_on_offering_id  (offering_id)
#  index_saves_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (offering_id => offerings.id)
#  fk_rails_...  (user_id => users.id)
#
class Save < ApplicationRecord
  belongs_to :offering, counter_cache: true
  belongs_to :user, counter_cache: true

end
