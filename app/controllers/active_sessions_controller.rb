class ActiveSessionsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @active_session = current_user.active_sessions.find(params[:id])

    @active_session.destroy

    if current_user
      redirect_to account_path, notice: "Sessão deletada."
    else
      forget_active_session
      redirect_to root_path, notice: "Logout realizado."
    end
  end

  def destroy_all
    forget_active_session
    current_user.active_sessions.destroy_all

    redirect_to root_path, notice: "Logout realizado."
  end
end
