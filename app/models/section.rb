class Section < ApplicationRecord
	has_many :section_edits
	has_many :editors, :through => :section_edits, :class_name => "AdminUser"
	scope :visible, lambda { where(:visible => true)}
    scope :invisible, lambda { where(:visible => false)}
    scope :sorted, lambda { order("subjects.position ASC")}
    scope :newest_first, lambda { order("subjects.created_at DESC")}
    scope :search, lambda {|query|
    	where(["name LIKE ?", "%#{query}%"])
    }
end
