class Page < ApplicationRecord
  
  belongs_to :subject, { :optional => true }
  has_and_belongs_to_many :admin_users
  has_many :sections
  
  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_article, lambda { order("created_at DESC") }
  
  validates :name,      :presence => true,
                        :length => { :maximum => 255 }
  validates :permalink, :presence => true,
                        :length => { :within => 3..255 },
                        :uniqueness => true
  # for unique values by subject use :scope => :subject_id
  
end
