class ReadershipsController < ApplicationController
  before_action :set_readership, only: [:show, :edit, :update, :destroy]

  def create
    book = Book.find_by(isbn: book_params[:isbn])
    unless book
      book = Book.create(book_params)
    end
    @user       = current_user
    @readership = Readership.new(user_id: @user.id, book_id: book.id, status: readership_params[:status])

    respond_to do |format|
      if @readership.save
        format.js { render :new }
      else
        format.html { render :new }
        format.json { render json: @readership.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @readership.update(read_book_params)
        format.html { redirect_to @readership, notice: 'Read book was successfully updated.' }
        format.json { render :show, status: :ok, location: @readership }
      else
        format.html { render :edit }
        format.json { render json: @readership.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @readership.destroy
    respond_to do |format|
      # format.html { redirect_to read_books_url, notice: 'Read book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_readership
      @readership = Readership.find(params[:id])
    end

    def user
      params.require(:readership).permit(:user_id)
    end

    def book_params
      params.require(:readership).permit(:isbn, :title, :author, :category, :pages, :description, :cover_small, :cover_medium, :cover_large)
    end

    def readership_params
      params.require(:readership).permit(:status)
    end
end
