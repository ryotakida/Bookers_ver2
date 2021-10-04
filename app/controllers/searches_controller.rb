class SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "User"
      @user = User.search(params[:search], params[:word])
    else
      @book = Book.search(params[:search], params[:word])
    end
  end
end
