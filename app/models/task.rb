class Task < ActiveRecord::Base
  validates :title, :presence => true
  validates :estimated_length, :numericality => { :only_integer => true, :greater_than => 0, :less_than => 6 }
end
