class GeneralHelpers
  class << self
    def generate_token
      rand(10**6).to_s.rjust(6, '0')
    end

    def snake_keys(hash)
      result = {}
      hash.each do |key, value|
        result[key.underscore] = value
      end
      result
    end

    def generate_csv(model:, fields: nil)
      model = model.capitalize.constantize
      if fields
        columns = model.column_names & fields
        return if columns.blank?

        model.select(columns).to_csv(exportable_fields: columns)
      else
        model.to_csv
      end
    end

    def frontend_url(suffix)
      "#{ENV.fetch('FRONTEND_URL', nil)}/#{suffix}"
    end

    def api_url(suffix)
      "#{ENV.fetch('API_URL', nil)}/#{suffix}"
    end

    def human_readable_date(date = Date.today)
      date.strftime('%A, %e %B %Y')
    end

    def is_email_valid?(email)
      EmailAddress.valid?(email)
    end
  end
end
