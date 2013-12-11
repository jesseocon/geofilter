class Restaurant < ActiveRecord::Base
  attr_accessible :name
  has_many :locations, as: :locatable
end