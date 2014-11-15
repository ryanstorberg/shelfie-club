class ReadBooksController < ApplicationController
  before_action :set_read_book, only: [:show, :edit, :update, :destroy]

  def create
    book       = Book.create(read_book_params)
    @read_book = ReadBook.new(user_id: user[:user_id], book_id: book.id)

    respond_to do |format|
      if @read_book.save
        format.html { redirect_to books_path, notice: 'Book was added!' }
        format.json { render :show, status: :created, location: @read_book }
      else
        format.html { render :new }
        format.json { render json: @read_book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @read_book.update(read_book_params)
        format.html { redirect_to @read_book, notice: 'Read book was successfully updated.' }
        format.json { render :show, status: :ok, location: @read_book }
      else
        format.html { render :edit }
        format.json { render json: @read_book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @read_book.destroy
    respond_to do |format|
      format.html { redirect_to read_books_url, notice: 'Read book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_read_book
      @read_book = ReadBook.find(params[:id])
    end

    def user
      params.require(:read_book).permit(:user_id)
    end

    def read_book_params
      params.require(:read_book).permit(:isbn, :title, :author, :category, :pages, :cover_image)
    end
end