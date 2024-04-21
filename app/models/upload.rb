# == Schema Information
#
# Table name: uploads
#
#  id              :uuid             not null, primary key
#  extension       :string
#  key             :string
#  media_type      :string
#  name            :string
#  total_bytes     :integer
#  uploadable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  plublic_id      :string
#  uploadable_id   :uuid
#
# Indexes
#
#  index_uploads_on_uploadable  (uploadable_type,uploadable_id)
#
class Upload < ApplicationRecord
  belongs_to :uploadable, polymorphic: true, optional: true

  def url
    S3Client.get_file_url(key)
  end
end
