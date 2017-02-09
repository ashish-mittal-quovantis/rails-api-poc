class Organization < ActiveRecord::Base
  ##ASSOCIATIONS##
  has_many :users, :dependent => :destroy
  has_many :appreciations
  has_many :celebrations
end
