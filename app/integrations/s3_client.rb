class S3Client
  class << self
    def upload_file(data, extension, key = nil)
      key = key.nil? ? "#{SecureRandom.uuid}.#{extension}" : "#{key}.#{extension}"
      obj = S3.bucket(ENV.fetch("S3_BUCKET_NAME", nil)).object(key)
      if extension == "csv"
        obj.put(body: data, content_type: "text/csv")
      else
        obj.put(body: data)
      end
      key
    end

    def get_file_url(key)
      obj = S3.bucket(ENV.fetch("S3_BUCKET_NAME", nil)).object(key)
      obj.presigned_url(:get)
    end
  end
end
