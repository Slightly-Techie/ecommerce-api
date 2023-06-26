class ApplicationController < ActionController::API
  skip_before_action :verify_authenticity_token, raise: false

  def healthcheck
    render json: { message: 'OK' }, status: :ok
  end
end
