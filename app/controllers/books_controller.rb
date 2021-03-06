class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end  

  
  def create
    @book = Book.new(book_params)
  
    #条件分岐
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'index'
    end
  end



  def show
    @book = Book.find(params[:id])
    if @book.save
      flash[:notice] = "successfully"
    else
      render 'index'
    end
    
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'edit'
    end
    
    
  end

  def destroy
    book = Book.find(params[:id]) #データ1件取得
    book.destroy #データ削除
    redirect_to books_path #一覧画面に戻る
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
