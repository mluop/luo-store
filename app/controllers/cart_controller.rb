class CartController < ApplicationController
  before_filter :authenticate_user!
  before_filter :helper

  def add
    @product = Product.find(params[:id])
    current_user.cart.add(@product, @product.price)
    redirect_to :cart_index
  end

  def remove
    @product = Product.find(params[:id])
    current_user.cart.remove(@product, 1)
    redirect_to :cart_index
  end

  def index
    @cart = current_user.cart
  end

  def clear
    current_user.cart.clear
    redirect_to :cart_index
  end

  private
    def helper
      unless current_user.cart
        current_user.cart = Cart.create
        current_user.save
      end
    end
end
