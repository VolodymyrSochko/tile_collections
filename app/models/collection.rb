class Collection < ApplicationRecord
    has_many :plates, dependent: :destroy
    has_one_attached :image
    validates :title, presence: true
    has_many :plates
  end
  