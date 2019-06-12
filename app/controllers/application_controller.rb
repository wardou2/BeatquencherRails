class ApplicationController < ActionController::API

  def log_in
    set_token
    if is_authorized
      # @user = User.add_new(name: params["name"], email: params["email"], google_token: @token)

      if User.find_by(email: params['email'])
        @user = User.find_by(email: params['email'])
      else
        @user = User.find_or_create_by!(name: params["name"], email: params["email"], google_token: @token)
      end

      puts "@user:", @user
      if @user.valid?
        render json: { user: UserSerializer.new(@user) }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    else
      puts 'failed log in'
    end
  end

  def is_authorized
    validator = GoogleIDToken::Validator.new
    required_audience = '510068393267-t5uivuplurovghmip1mrcrpvs2tbi936.apps.googleusercontent.com'
    optional_client_id = '510068393267-t5uivuplurovghmip1mrcrpvs2tbi936.apps.googleusercontent.com'

    begin
      payload = validator.check(@token, required_audience, optional_client_id)
      if payload
        return true
      else
        return false
      end
    rescue GoogleIDToken::ValidationError => e
      puts e
    end
  end

  private

  def set_token
    @token = request.headers["HTTP_ID_TOKEN"]
  end
end
