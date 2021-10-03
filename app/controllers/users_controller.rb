class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.page(params[:page])
    @books_comments = BooksComment.all

  end
  def edit
    @user = User.find(params[:id])
    if current_user == @user
      render :edit
    else
      redirect_to user_path(current_user)
    end
      
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end  
  end
  
  def index
    @users = User.all
    @book = Book.new 
    
  
  end  
  def follow(user_id)
    @relationships.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    @relationships.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    @followings.include?(user)
  end  
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
