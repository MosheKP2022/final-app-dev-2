# == Schema Information
#
# Table name: contact_us_messages
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :citext
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_contact_us_messages_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class ContactUsMessage < ApplicationRecord
  belongs_to :user
end
