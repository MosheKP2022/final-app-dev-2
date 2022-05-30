# == Schema Information
#
# Table name: users
#
#  id                        :bigint           not null, primary key
#  about_me                  :text
#  address                   :citext
#  admin                     :boolean
#  comments_count            :integer          default(0)
#  contact_us_messages_count :integer          default(0)
#  email                     :citext           default(""), not null
#  encrypted_password        :string           default(""), not null
#  first_name                :citext
#  kids_count                :integer          default(0)
#  last_name                 :citext
#  offerings_count           :integer          default(0)
#  phone                     :bigint
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
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_phone                 (phone) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :own_offerings, class_name: "offering", foreign_key: "seller_id", dependent: :destroy

  has_many :comments, foreign_key: "commenter_id"

  has_many :contact_us_messages, dependent: :nullify

  has_many :family_members, dependent: :destroy

  has_many :saves, dependent: :destroy

  has_many :kids, through: :family_members

  has_many :saved_offerings, through: :saves, source: :offering

  validates :phone, presence: true, uniqueness: true

  validates :last_name, presence: true

  validates :first_name, presence: true

  validates :admin, presence: true






end
