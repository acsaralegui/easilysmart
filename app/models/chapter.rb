class Chapter < ApplicationRecord
  belongs_to :section
  mount_uploader :video, VideoUploader
end
