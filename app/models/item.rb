class Item < ApplicationRecord
   validates :price, numericality: {greater_than: 0, allow_nill: true}
   validates :name,:description, presence: true
   
   
    
end
