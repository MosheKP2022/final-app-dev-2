# == Schema Information
#
# Table name: offerings
#
#  id                      :bigint           not null, primary key
#  comments_count          :integer          default(0)
#  date                    :date
#  description             :text
#  image                   :string
#  labeled_offerings_count :integer          default(0)
#  max_age                 :float
#  min_age                 :float
#  price                   :float
#  saves_count             :integer          default(0)
#  time                    :time
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
class Offering < ApplicationRecord

  belongs_to :seller, class_name: "User", counter_cache: true

  has_many :comments

  has_many :labeled_offerings

  has_many :saves

  has_many :cold_leads, through: :saves, source: :user

  has_many :warm_leads, through: :comments, source: :commenter

  has_many :tags, through: :labeled_offerings

end
