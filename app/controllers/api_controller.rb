class ApiController < ActionController::API
  def healthcheck
    render json: { message: "OK" }, status: :ok
  end
end
