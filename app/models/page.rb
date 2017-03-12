class Page < ApplicationRecord
  
  belongs_to :subject, { :optional => true }
  has_and_belongs_to_many :admin_users
  has_many :sections
  
  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_article, lambda { order("created_at DESC") }
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  validates_uniqueness_of :permalink
  # for unique values by subject use :scope => :subject_id
  
end
