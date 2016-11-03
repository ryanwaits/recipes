class Formula < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :directions, dependent: :destroy

  has_attached_file :image, styles: { medium: "300x300>" }, dependent: :destroy

  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :directions

  validates_presence_of :title, :description
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
