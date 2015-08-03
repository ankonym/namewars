class Kidsname < ActiveRecord::Base
  attr_accessible :gender, :name, :rank, :score, :count

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :gender, presence: {message: "Dieses Feld darf nicht leer sein."}
end
