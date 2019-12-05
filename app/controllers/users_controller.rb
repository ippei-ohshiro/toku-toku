class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :followings, 
                                        :followers]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'メールを送信しました。本文から登録を完了してください'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = '更新しました。'
      redirect_to @user
    else
      flash.now[:danger] = '更新に失敗しました。'
      render 'edit'
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page]).per(5)
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page]).per(5)
    counts(@user)
  end
  
  private
  #ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  # beforeアクション

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
    
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
