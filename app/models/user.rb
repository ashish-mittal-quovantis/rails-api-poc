class User < ActiveRecord::Base
  # Include default devise modules :confirmable, :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :announcement_receivers, class_name: "AnnouncementReceiver", :foreign_key => 'receiver_id', :dependent => :destroy
  has_many :received_appreciations, :through => :announcement_receivers, :source => :appreciation
  has_many :received_celebrations, :through => :announcement_receivers, :source => :celebration
  has_many :given_appreciations, class_name: "Appreciation", :foreign_key => 'giver_id', :dependent => :destroy
  has_many :given_celebrations, class_name: "Celebration", :foreign_key => 'giver_id', :dependent => :destroy
  has_many :given_announcements, class_name: "Announcement", :foreign_key => 'giver_id', :dependent => :destroy

  belongs_to :organization
end
