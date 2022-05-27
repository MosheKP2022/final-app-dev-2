class Offering < ApplicationRecord

  belongs_to :seller, class_name: "User"

  has_many :comments

end
