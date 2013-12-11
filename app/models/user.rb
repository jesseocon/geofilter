class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_many :locations, as: :locatable
end
