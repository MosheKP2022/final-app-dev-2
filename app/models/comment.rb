# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  body         :text             not null
#  private      :boolean          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commenter_id :bigint           not null
#  offering_id  :bigint           not null
#
# Indexes
#
#  index_comments_on_commenter_id  (commenter_id)
#  index_comments_on_offering_id   (offering_id)
#
# Foreign Keys
#
#  fk_rails_...  (commenter_id => users.id)
#  fk_rails_...  (offering_id => offerings.id)
#
class Comment < ApplicationRecord
  belongs_to :commenter, class_name: "User", counter_cache: true
  belongs_to :offering, counter_cache: true

  validates :body, presence: true
  
end
