class CrmService
  include HTTParty
  base_uri "https://crm-api.fly.dev/api/v1"

  def self.fetch_user_info(email)
    response = get("/users/user_info", query: { email: email }).parsed_response
    response["status"] == 200 ? response["data"] : nil
  end
end
