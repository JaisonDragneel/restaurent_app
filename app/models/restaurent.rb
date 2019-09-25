class Restaurent < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :name, :uniqueness => { :case_sensitive => false }, :presence => true
  validates :address, :uniqueness => { :case_sensitive => false }, :presence => true

  has_many :reviews
  has_many :users, :through => :reviews

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
