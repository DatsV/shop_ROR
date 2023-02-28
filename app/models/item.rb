class Item < ApplicationRecord
  
  has_many :orders_descriptions

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, comparison: { greater_than: 0 } 
  
end
