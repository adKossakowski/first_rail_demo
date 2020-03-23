class Portfolio < ApplicationRecord

  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :ruby_on_rails, -> { where(subtitle: "Ruby on rails") }

  def self.angular
    where(subtitle: "Angular")
  end
end
