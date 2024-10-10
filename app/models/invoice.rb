class Invoice < ApplicationRecord
  validates :name, :surname, :email, presence: true
  belongs_to :collection
end
