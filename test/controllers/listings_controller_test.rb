require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  setup do
    @listing = listings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post :create, listing: { description_english: @listing.description_english, description_spanish: @listing.description_spanish, name_english: @listing.name_english, name_spanish: @listing.name_spanish, size_english: @listing.size_english, size_spanish: @listing.size_spanish, string: @listing.string, weight: @listing.weight }
    end

    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should show listing" do
    get :show, id: @listing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listing
    assert_response :success
  end

  test "should update listing" do
    patch :update, id: @listing, listing: { description_english: @listing.description_english, description_spanish: @listing.description_spanish, name_english: @listing.name_english, name_spanish: @listing.name_spanish, size_english: @listing.size_english, size_spanish: @listing.size_spanish, string: @listing.string, weight: @listing.weight }
    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete :destroy, id: @listing
    end

    assert_redirected_to listings_path
  end
end
