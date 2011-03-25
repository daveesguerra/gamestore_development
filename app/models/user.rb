require "digest/sha1"

class User < ActiveRecord::Base

  attr_accessor :password
  attr_accessible :name, :password, :email

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates_presence_of :name, :password, :email

  validates_uniqueness_of :name, :email


  def before_create
    self.hashed_password = User.hash_password(self.password)
  end

  def after_create
    @password = nil
  end

  def self.login(name, password)
    hashed_password = hash_password(password || '')
    self.find(:first, :conditions => ["name = ? AND hashed_password = ?", name, hashed_password])
  end

  def try_to_login
    User.login(self.name, self.password)
  end

  private #----------------------

  def self.hash_password(password)
    Digest::SHA1.hexdigest(password)
  end
end
