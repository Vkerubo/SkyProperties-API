class ApplicationController < ActionController::API
  before_action :authorize

  private
  def authorize
    return render json: {errors: "Not authorized"}, status: :unauthorized unless session.include? :user_id
  end
end
