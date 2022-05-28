# == Schema Information
#
# Table name: users
#
#  id                        :bigint           not null, primary key
#  about_me                  :text
#  admin                     :boolean
#  comments_count            :integer          default(0)
#  contact_us_messages_count :integer          default(0)
#  encrypted_password        :string           default(""), not null
#  kids_count                :integer          default(0)
#  offerings_count           :integer          default(0)
#  phone                     :integer
#  profile_picture           :string
#  remember_created_at       :datetime
#  reset_password_sent_at    :datetime
#  reset_password_token      :string
#  saves_count               :integer          default(0)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
# Indexes
#
#  index_users_on_phone                 (phone) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
