class Album < ActiveRecord::Base
  has_many :images

  validates :name, :presence => true
end
