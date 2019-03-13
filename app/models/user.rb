class User < ApplicationRecord
  has_secure_password
  validates :email_address, uniqueness: {case_sensitive: true}
  has_many :hosted_suppers, class_name: "Supper"
  has_many :bookings
  has_many :attended_suppers, class_name: "Supper", through: :bookings
end
