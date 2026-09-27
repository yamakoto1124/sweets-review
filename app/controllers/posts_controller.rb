class PostsController < ApplicationController
  # 一覧や詳細は未ログインでも閲覧可にする場合
  allow_unauthenticated_access only: [:index, :show]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Current.user.posts.build(post_params)
    # ※まだジャンル機能が未実装の場合は仮で 1 などを入れておく
    @post.genre_id ||= 1

    if @post.save
      redirect_to root_path, notice: "レビューを投稿しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿を更新しました！"
    else
      render :edit, status: :unprocessable_entity # 失敗時はedit画面を再描画（要件7・8）
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :genre_id)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == Current.user
      redirect_to posts_path, alert: "他のユーザーの投稿は編集・削除できません。"
    end
  end
end
