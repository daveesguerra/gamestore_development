class Developer < ActiveRecord::Base

  has_many :games

  validates_presence_of :developer, :image_path

  validates_length_of :developer, :maximum => 255
  validates_uniqueness_of :developer

end
