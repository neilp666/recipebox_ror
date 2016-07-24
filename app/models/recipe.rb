class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :directions
  has_many :ingredients


  accepts_nested_attributes_for :ingredients,
  reject_if: :all_blank, allow_destroy: true

  accepts_nested_attributes_for :directions,
  reject_if: :all_blank, allow_destroy: true


  validates :title, :description, :image, presence: true
  has_attached_file :image, styles: { medium: "400x400>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
