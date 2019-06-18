class ApplicationController < ActionController::API

  before_action :is_authorized, only: [:log_in, :init]

  def log_in

    # if is_authorized
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
    # else
    #   render json: { error: 'not logged in' }, status: :not_acceptable
    # end
  end

  def is_authorized
    set_token
    puts 'authorizing'
    validator = GoogleIDToken::Validator.new
    required_audience = '510068393267-t5uivuplurovghmip1mrcrpvs2tbi936.apps.googleusercontent.com'
    optional_client_id = '510068393267-t5uivuplurovghmip1mrcrpvs2tbi936.apps.googleusercontent.com'

    begin
      payload = validator.check(@token, required_audience, optional_client_id)
      if payload
        puts 'verified'
        return true
      else
        puts 'not verified'
        render json: { error: 'not logged in' }, status: :not_acceptable
      end
    rescue GoogleIDToken::ValidationError => e
      puts e
      render json: { error: e }, status: :not_acceptable
    end
  end

  def init
    @user = User.find(project_params['user_id'])
    @project = Project.create(title: project_params['title'], tempo: project_params['tempo'])
    @project.user_projects.create(user_id: @user.id)

    instrumentPs = []

    instrumentPs << InstrumentPreset.find_by(ins_type: 'bass_drum')
    instrumentPs << InstrumentPreset.find_by(ins_type: 'open_hihat')
    instrumentPs << InstrumentPreset.find_by(ins_type: 'closed_hihat')
    instrumentPs << InstrumentPreset.find_by(ins_type: 'snare')

    instruments = []

    instrumentPs.each do |insP|
      instruments << Instrument.create(ins_type: insP.ins_type, name: insP.name, options: insP.options, effects: insP.effects, project: @project)
    end

    scene_array = []

    (project_params['scene_count']).to_i.times do |i|
      name = 'Scene ' + (i+1).to_s
      scene = Scene.create(name: name, project: @project)

      instruments.each do |ins|
        track = Track.create(instrument: ins, scene: scene)
      end
    end

    render json: @project
  end

  private

  def set_token
    @token = request.headers["HTTP_ID_TOKEN"]
    puts @token
  end

  def project_params
    params.require(:project).permit(:title, :tempo, :user_id, :scene_count)
  end
end
