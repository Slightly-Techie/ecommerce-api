class ApiController < ActionController::API

include Authenticable
  def healthcheck
    render json: { message: "OK" }, status: :ok
  end
end
