require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
      @update = {
        title: 'Lorem Ipsum',
        description: 'Wibbles are fun!',
        image_url: 'air.jpg',
        price: 19.95
      }
  end

  test "should get index" do
    get products_path
    assert_response :success
  end

  test "should get new" do
    get new_product_path
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      #debugger
      post products_path, params: { product: @update }
    end
    assert_redirected_to product_path(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_path(@product)
    assert_response :success
  end

  test "should update product" do
    #debugger
    put product_path(@product), params: { product: @update }
    assert_redirected_to product_path(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
