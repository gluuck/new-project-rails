class Item < ApplicationRecord
   validates :price, numericality: {greater_than: 0, allow_nill: true}
   validates :name,:description, presence: true
   
   after_initialize {p 'initialize'}
   after_create {p 'create'}
   after_destroy {p 'destroy'} 
end
