class Plan < ActiveRecord::Base
  # AR classes are singular and capitalized by convention
belongs_to :user

geocoded_by :address
  after_validation :geocode

end