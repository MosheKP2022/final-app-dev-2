# == Schema Information
#
# Table name: users
#
#  id                               :bigint           not null, primary key
#  about_me                         :text
#  admin                            :boolean
#  comments_count                   :integer          default(0)
#  encrypted_password               :string           default(""), not null
#  kids_count                       :integer          default(0)
#  messages_to_administrators_count :integer          default(0)
#  offerings_count                  :integer          default(0)
#  phone                            :integer
#  profile_picture                  :string
#  remember_created_at              :datetime
#  reset_password_sent_at           :datetime
#  reset_password_token             :string
#  saves_count                      :integer          default(0)
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#
# Indexes
#
#  index_users_on_phone                 (phone) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :own_offerings, class_name: "offering", foreign_key: "seller_id"

  has_many :comments, foreign_key: "commenter_id"

  has_many :contact_us_messages

  has_many :family_members

  has_many :saves

  has_many :kids, through: :family_members

  has_many :saved_offerings, through: :saves




end
