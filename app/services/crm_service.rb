class CrmService
  include HTTParty
  base_uri "https://crm-api.fly.dev"

  def self.fetch_user_info(email)
    response = get("/user_info", query: { email: email }).parsed_response
    response["status"] == 200 ? response["data"] : nil
  end
end
