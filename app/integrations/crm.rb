class CRM
  CLIENT = Faraday.new(url: ENV.fetch('CRM_URL', nil), headers: { "Content-Type": 'application/json' })

  def self.fetch(email)
    res = CLIENT.get('/users/user_info', { email: })
    res['status'] == 200 ? res['data'] : nil
  end
end
