class Portfolio < ApplicationRecord
  includes Placeholder

  accepts_nested_attributes_for :technologies, reject_if: lambda { |attr| attr['name'].blank? }

  has_many :technologies

  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :ruby_on_rails, -> { where(subtitle: "Ruby on rails") }

  def self.angular
    where(subtitle: "Angular")
  end

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(600, 400)
    self.thumb_image ||= Placeholder.image_generator(300, 200)
  end

end
