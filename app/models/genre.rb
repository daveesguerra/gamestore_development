class Genre < ActiveRecord::Base

  has_many :games

  validates_presence_of :genre

  validates_length_of :genre, :maximum => 32
  validates_uniqueness_of :genre

  
end
