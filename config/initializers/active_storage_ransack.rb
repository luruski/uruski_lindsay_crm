# Allow ActiveAdmin/Ransack to work with ActiveStorage attachments.
# Without this, the admin Customers page errors because Ransack
# refuses to touch the image's attachment/blob tables until they're
# explicitly marked searchable.

Rails.application.config.to_prepare do
  ActiveStorage::Attachment.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      ["blob_id", "created_at", "id", "name", "record_id", "record_type"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["blob", "record"]
    end
  end

  ActiveStorage::Blob.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      ["byte_size", "checksum", "content_type", "created_at", "filename", "id", "key", "metadata", "service_name"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["attachments"]
    end
  end
end
