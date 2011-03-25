class Game < ActiveRecord::Base

  belongs_to :developer
  belongs_to :publisher
  belongs_to :console
  belongs_to :genre

  has_many :line_items

  has_and_belongs_to_many :features

  validates_presence_of :title, :image_path, :price, :console_id, :publisher_id, :developer_id, :genre_id

  validates_length_of :title, :maximum => 255
  validates_numericality_of :price

end
