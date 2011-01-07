class Person < ActiveRecord::Base
  
  validates_presence_of :name
  validates_length_of :last_name, :in => 2..10, :message => "is required"

end
