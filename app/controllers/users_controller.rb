class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: 'Welcome! You have signed up successfully.'
    else
      render :new
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Signed in successfully."
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Signed out successfully."
    redirect_to root_path
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    else
      @user = User.find(params[:id])
      @book = Book.new
    end
  end

  def index
    @users = User.all
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      @book = Book.new
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :body, :introduction, :profile_image)
  end

end