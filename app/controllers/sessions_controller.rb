class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]
  before_action :authenticate_user!, only: [:destroy]

  def create
    @user = User.authenticate_by(email: params[:user][:email].downcase, password: params[:user][:password])
    if @user
      if @user.unconfirmed?
        redirect_to new_confirmation_path, alert: "Email ou senha incorretos."
      else
        after_login_path = session[:user_return_to] || root_path
        login @user
        active_session = login @user
        remember(active_session) if params[:user][:remember_me] == "1"
        redirect_to after_login_path, notice: "Logado com sucesso."
      end
    else
      flash.now[:alert] = "Email ou senha incorretos."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    forget_active_session
    logout
    redirect_to root_path, notice: "Logout realizado com sucesso!"
  end

  def new
  end
end
