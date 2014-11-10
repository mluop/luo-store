class CartController < ApplicationController
  before_filter :helper, only: [:add, :remove]

  def add
    current_user.cart.add(@product, @product.price)
    redirect_to :cart_index
  end

  def remove
    current_user.cart.remove(@product, 1)
    redirect_to :cart_index
  end

  def index
    @cart = current_user.cart
  end

  private
    def helper
      unless current_user.cart
        current_user.cart = Cart.create
        current_user.save
      end
      @product = Product.find(params[:id])
    end
end
