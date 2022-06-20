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
class Offering < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :seller, class_name: "User", counter_cache: true

  has_many :comments, dependent: :destroy

  has_many :labeled_offerings, dependent: :destroy

  has_many :saves, dependent: :destroy

  has_many :cold_leads, through: :saves, source: :user

  has_many :warm_leads, through: :comments, source: :commenter

  has_many :tags, through: :labeled_offerings


  validates :description, presence: true

  validates :min_age, numericality: { greater_than_or_equal_to: 0 }

  validates :max_age, numericality: { greater_than_or_equal_to: :min_age, less_than: 99 }

  validates :price, presence: true

  validates :address, presence: true
  
  validates :image, presence: true

  # validates :title, presence: true, uniqueness: { scope: :user_id, message: "has already posted this offering" }

  #validates :price, numericality: :greater_than_or_equal_to: 0

  #validates :min_age, numericality: :greater_than_or_equal_to: 0


  enum status: { Pending: "Pending", Available: "Available", Sold: "Sold" }

  


end
