class Admin::UsersController < ApplicationController
  allow_unauthenticated_access
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(is_deleted: true)
      redirect_to admin_user_path(@user), notice: "会員を退会処理しました"
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def authenticate_admin!
    unless session[:admin_id] && Admin.exists?(id: session[:admin_id])
      redirect_to new_admin_session_path, alert: "管理者ログインが必要です"
    end
  end
end