# frozen_string_literal: true

class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true, optional: true

  mount_uploader :file, FileUploader

  def url
    file.url
  end
end
