class ApiApplicationController < ActionController::API
  include ExceptionHandler

  around_action :switch_locale
  before_action :authorize_request
  before_action :check_user_verfied , except: [:authorize_request]



  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def response_success(data: [] , status: :ok)
    render json: {
      :data => data,
      :message => I18n.t('success_action')
    }, status: status
  end

  def response_faild(errors: [] , status: :server_error)
    render json: {
      :data => [],
      :errors => errors,
      :message => I18n.t('failed_action')
    }, status: status
  end

  def authorize_request
    unless request.headers.include?('Authorization')
      return response_faild(
        errors: I18n.t(:unauthorized),
        status: :unauthorized
      )
    end

    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue
      response_faild(
        errors: "unauthorized".upcase,
        status: :unauthorized
      )
    end
  end

  private

  def check_user_verfied
    response_faild(
      errors: I18n.t(:un_verifyed_email),
      status: :unauthorized
    ) if @current_user&.is_unverifyed
  end
end
