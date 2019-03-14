class Supper < ApplicationRecord
  has_many :bookings
  has_many :guests, through: :bookings, source: :user
  belongs_to :host, class_name: 'User', foreign_key: :user_id
end
