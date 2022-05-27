class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :own_offerings, class_name: "offering", foreign_key: "seller_id"

  has_many :comments, foreign_key: "commenter_id"

  
end
