class Subgroup < ActiveRecord::Base
    belongs_to :maingroup
    has_many :products
end
