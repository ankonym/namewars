class Kidsname < ActiveRecord::Base
  attr_accessible :gender, :name, :rank, :score, :count
  validates :name, uniqueness:true, presence: true
  validates :gender, presence: true
end
