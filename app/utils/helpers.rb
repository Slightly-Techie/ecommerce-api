class Helpers
  class General
    class << self
      def generate_token
        rand(10**6).to_s.rjust(6, "0")
      end

      def client_url(path)
        "#{ENV.fetch('WEB_CLIENT_URL', nil)}/#{path}"
      end

      def api_url(path)
        "#{ENV.fetch('API_URL', nil)}/#{path}"
      end
    end
  end

  class File
    class << self
      def upload(data, extension, key = nil)
        key = key.nil? ? "#{SecureRandom.uuid}.#{extension}" : "#{key}.#{extension}"
        obj = S3.bucket(ENV.fetch("S3_BUCKET_NAME", nil)).object(key)
        if extension == "csv"
          obj.put(body: data, content_type: "text/csv")
        else
          obj.put(body: data)
        end
        key
      end

      def url(key)
        obj = S3.bucket(ENV.fetch("S3_BUCKET_NAME", nil)).object(key)
        obj.presigned_url(:get)
      end

      def delete(key)
        obj = Upload.find_by(key:)
        return unless obj.present?

        obj.destroy
        S3.bucket(ENV.fetch("S3_BUCKET_NAME", nil)).object(key).delete
      end
    end
  end
end
