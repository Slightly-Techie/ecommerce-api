class APIController < ActionController::API
  def healthcheck
    render json: { message: "OK" }, status: :ok
  end
end
