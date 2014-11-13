class ReadBooksController < ApplicationController
  before_action :set_read_book, only: [:show, :edit, :update, :destroy]

  # GET /read_books
  # GET /read_books.json
  def index
    @read_books = ReadBook.all
  end

  # GET /read_books/1
  # GET /read_books/1.json
  def show
  end

  # GET /read_books/new
  def new
    @read_book = ReadBook.new
  end

  # GET /read_books/1/edit
  def edit
  end

  # POST /read_books
  # POST /read_books.json
  def create
    @read_book = ReadBook.new(read_book_params)

    respond_to do |format|
      if @read_book.save
        format.html { redirect_to @read_book, notice: 'Read book was successfully created.' }
        format.json { render :show, status: :created, location: @read_book }
      else
        format.html { render :new }
        format.json { render json: @read_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /read_books/1
  # PATCH/PUT /read_books/1.json
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

  # DELETE /read_books/1
  # DELETE /read_books/1.json
  def destroy
    @read_book.destroy
    respond_to do |format|
      format.html { redirect_to read_books_url, notice: 'Read book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_read_book
      @read_book = ReadBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def read_book_params
      params[:read_book]
    end
end
