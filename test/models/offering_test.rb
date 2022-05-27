# == Schema Information
#
# Table name: offerings
#
#  id                      :bigint           not null, primary key
#  address                 :citext
#  comments_count          :integer          default(0)
#  date                    :date
#  description             :text
#  image                   :string
#  labeled_offerings_count :integer          default(0)
#  max_age                 :float
#  min_age                 :float
#  price                   :float
#  saves_count             :integer          default(0)
#  status                  :citext
#  time                    :time
#  title                   :citext
#  video                   :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  seller_id               :bigint           not null
#
# Indexes
#
#  index_offerings_on_seller_id  (seller_id)
#
# Foreign Keys
#
#  fk_rails_...  (seller_id => users.id)
#
require "test_helper"

class OfferingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
