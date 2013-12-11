class Restaurant < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :locations, as: :locatable
end
