class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.page(params[:page])
    @books_comments = BooksComment.all
    @currentEntry = Entry.where(user_id: current_user.id)  #current_userが既にルームに参加しているか判断
    @receiveUser = Entry.where(user_id: @user.id)  #他の@userがルームに参加しているか判断
    unless @user.id == current_user.id  #current_userと@userが一致していなければ
      @currentEntry.each do |cu|    #current_userが参加していルームを取り出す
        @receiveUser.each do |u|    #@userが参加しているルームを取り出す
          if cu.room_id == u.room_id    #current_userと@userのルームが同じか判断(既にルームが作られているか)
            @haveRoom = true    #falseの時(同じじゃない時)の条件を記述するために変数に代入
            @roomId = cu.room_id   #ルームが共通しているcurrent_userと@userに対して変数を指定
          end
        end
      end
      unless @haveroom    #ルームが同じじゃなければ
        #新しいインスタンスを生成
        @room = Room.new
        @Entry = Entry.new
        #//新しいインスタンスを生成
      end
    end    

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

  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
