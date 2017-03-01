class Page < ApplicationRecord
  
  belongs_to :subject, { :optional => true }
  has_and_belongs_to_many :admin_users
  has_many :sections
  
  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_article, lambda { order("created_at DESC") }
  
end
