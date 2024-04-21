class GeneralHelpers
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
