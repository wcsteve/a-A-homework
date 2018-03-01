class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :house_id, presence: true

end
