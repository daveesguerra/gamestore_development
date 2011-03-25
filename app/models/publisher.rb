class Publisher < ActiveRecord::Base

  has_many :games

  validates_presence_of :publisher, :image_path

  validates_length_of :publisher, :maximum => 255
  validates_uniqueness_of :publisher
end
