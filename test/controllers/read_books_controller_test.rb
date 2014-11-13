require 'test_helper'

class ReadBooksControllerTest < ActionController::TestCase
  setup do
    @read_book = read_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:read_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create read_book" do
    assert_difference('ReadBook.count') do
      post :create, read_book: {  }
    end

    assert_redirected_to read_book_path(assigns(:read_book))
  end

  test "should show read_book" do
    get :show, id: @read_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @read_book
    assert_response :success
  end

  test "should update read_book" do
    patch :update, id: @read_book, read_book: {  }
    assert_redirected_to read_book_path(assigns(:read_book))
  end

  test "should destroy read_book" do
    assert_difference('ReadBook.count', -1) do
      delete :destroy, id: @read_book
    end

    assert_redirected_to read_books_path
  end
end
