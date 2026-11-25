class Admin::SessionsController < ApplicationController
  allow_unauthenticated_access only: [:new, :create]

  def new
  end

  def create
    admin = Admin.find_by(email_address: params[:email_address])
    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_users_path, notice: "管理者としてログインしました"
    else
      flash.now[:alert] = "メールアドレスまたはパスワードが違います"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:admin_id)
    redirect_to new_admin_session_path, notice: "ログアウトしました", status: :see_other
  end
end