class City < ApplicationRecord
  validates :name, presence: true
  belongs_to :country
  has_many :reviews, dependent: :destroy
end
