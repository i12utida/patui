class Product < ActiveRecord::Base
    validates(:jan_code, presence: true, uniqueness: true)
    validates :product_name, presence: true
    validates :product_stack, presence: true, numericality: {greater_than_or_equal_to:0}
    validates(:product_cost, presence: true, numericality: {greater_than_or_equal_to:0})
    validates :product_type, presence: true
    
    def self.product_type_choice
    [['弁当類','lunch'],
     ['パン類','bread'],
     ['麺類','noodle'],
     ['飲料類','drink']
    ]
  end
  
end
