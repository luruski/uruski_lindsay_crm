class Customer < ApplicationRecord
  # Each customer can have one attached image
  has_one_attached :image

  # Validations: full name is required, and email must look like an email when present
  validates :full_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  # Tell ActiveAdmin/Ransack which columns are allowed to be searched/filtered
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "full_name", "id", "notes", "phone_number", "updated_at"]
  end

  # Tell ActiveAdmin/Ransack which associations are allowed to be searched
  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end
end