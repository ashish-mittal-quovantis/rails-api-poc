class Announcement < ApplicationRecord
  has_many :announcement_receivers, class_name: "AnnouncementReceiver", :foreign_key => 'announcement_id', :dependent => :destroy
  has_many :receivers, :through => :announcement_receivers, :source => :receiver

  belongs_to :giver, class_name: "User", :foreign_key => 'giver_id'
  belongs_to :organization
end