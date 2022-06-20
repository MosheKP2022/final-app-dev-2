# == Schema Information
#
# Table name: tags
#
#  id                      :bigint           not null, primary key
#  labeled_offerings_count :integer
#  name                    :citext
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
require "test_helper"

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
