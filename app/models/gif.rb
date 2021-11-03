class Gif < ApplicationRecord
  belongs_to :user

  has_one_attached :file

  validate :file_validation

  def file_validation
    if file.attached?
      errors.add(:file, "must be below 1MB") if file.blob.byte_size > 1_000_000
      errors.add(:file, "Must be Gif") unless file.blob.content_type == "image/gif"
    end
  end

end
