class Console < ActiveRecord::Base

  has_many :games

  validates_presence_of :console, :image_path

  validates_length_of :console, :maximum => 255
  validates_uniqueness_of :console

end
