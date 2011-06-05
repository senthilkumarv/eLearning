class Topic < ActiveRecord::Base
    belongs_to :category
    has_many :ratings

end
