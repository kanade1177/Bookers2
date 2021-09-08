class UsersController < ApplicationController
 before_action :correct_user, only: [:edit]

  def index
    @users = User.all

    @book = Book.new
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @today_book = @books.created_today
    @yesterday_book = @books.created_yesterday
    @thisweek_book = @books.created_thisweek
    @lastweek_book = @books.created_a_week_ago
    @thismonth_book = @books.created_thismonth
    @lastmonth_book = @books.created_a_month_ago

  end


  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(current_user)
    end
  end

end
