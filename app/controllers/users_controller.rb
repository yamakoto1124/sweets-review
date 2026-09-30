class UsersController < ApplicationController
  allow_unauthenticated_access only: [:new, :create] #未ログインでも見れるように許可
 
  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      # ユーザー登録成功後、ログイン画面へリダイレクト
      redirect_to new_session_path, notice: "ユーザー登録が完了しました！続けてログインしてください。"
    else
      # エラー時はフォームを再表示
      render :new, status: :unprocessable_entity
    end
  end

   def edit
     @user = User.find(params[:id]) #ユーザURLに含まれるidをもとに対象のレコードを一件取得　URLをかえられると別の人のが見れてしまうbefore_actionではじく
   end
    
   def show
     @user = User.find(params[:id]) #@User = Current.user? URLに含まれるidをもとに対象のレコードを一件取得User.find...データベースに既に存在する登録済みデータを取り出す
     @reviews =@user.reviews            #１ユーザに複数のレビューがあるかもだから@reviewsていう箱に１ユーザの複数のレビューが入っている？　ユーザが投稿したレビュー一覧を取得
   end
    
   def update
      @user = User.find(params[:id]) #変更するデータを取得する
      if @user.update(user_params) #ユーザの箱に安全に許可された入力項目をいれる
        redirect_to user_path(@user), notice: "会員情報を更新しました。" #マイページに移動(詳細画面　user_path(@user)ルーティングヘルパー@userに特定のデータを渡すことで表示させる　notice: フラッシュメッセージ表示機能
      else
        render :edit, status: :unprocessable_entity #rediret_toだと入力データが消えてしまう　データを残したまま画面を再表示　:unprocessable_entityはエラーメッセージが画面に正しく表示されない　フォーム送信時の挙動がおかしくなる
      end 
   end

   def destroy
     @user = User.find(params[:id]) #削除したいデータを取得する　
     @user.destroy                  #選択したデータを消す

     terminate_session #ログイン状態を放棄
     redirect_to new_user_path, notice: "退会手続きが完了しました。"  #destoroyはelseで書かないのが一般的　消すだけだから

   end

  end
 
  private
 
  def user_params
    params.require(:user).permit(
  :last_name,
  :first_name,
  :last_name_kana,
  :first_name_kana,
  :email_address,
  :password,
  :password_confirmation
  )
  end
end