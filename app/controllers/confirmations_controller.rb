class ConfirmationsController < ApplicationController
  def create
    @user = User.find_by(email: params[:user][:email].downcase)

    if @user.present? && @user.unconfirmed?
      @user.send_confirmation_email!
      redirect_to root_path, notice: "As instruções para verificar a sua conta foram enviadas para o seu email."
    else
      redirect_to new_confirmation_path, alert: "Não foi possível encontrar um usuário com este email ou o usuário já foi verificado."
    end
  end

  def edit
    @user = User.find_signed(params[:confirmation_token], purpose: :confirm_email)

    if @user.present? && @user.unconfirmed_or_reconfirming?
      if @user.confirm!
        login @user
        redirect_to root_path, notice: "Sua conta foi verificada!"
      else
        redirect_to new_confirmation_path, alert: "Algo deu errado."
      end
    else
      redirect_to new_confirmation_path, alert: "Token inválido."
    end
  end

  def new
    @user = User.new
  end
end
