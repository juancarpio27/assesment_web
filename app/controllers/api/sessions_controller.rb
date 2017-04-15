class Api::SessionsController < ApiController
  # POST /api/sessions/plain
  def plain
    user = User.find_by(email: params[:email])
    if user && user.valid_password?(params[:password])
      session = user.sessions.build(platform: 0)
      session.create_api_key(user: user)
      render json: {success: true, user: user.as_json(User::Json::SHOW)}
    else
      render json: {success: false}
    end
  end

  #DELETE /api/sessions/:id
  def destroy
    session = @api_key.user.sessions.active.last
    if session.delete!
      {success: true}
    else
      {success: false}
    end
  end
end
