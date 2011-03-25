class Feature < ActiveRecord::Base
  has_and_belongs_to_many :games

  validates_presence_of :feature

  validates_length_of :feature, :maximum => 255
  validates_uniqueness_of :feature
end
