class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @products = Product.includes(:user).order("created_at DESC")
    @action = Product.where(category_id:2)
    @sf = Product.where(category_id:3)
    @comedy = Product.where(category_id:4)
    @human = Product.where(category_id:5).or(Product.where(category_id:9))
    @fantasy = Product.where(category_id:6)
    @lovestory = Product.where(category_id:7)
    @horror = Product.where(category_id:8)
    @musical= Product.where(category_id:10)
    @war = Product.where(category_id:11)
    @documentary = Product.where(category_id:12)
    @jmovie = Product.where(category_id:13)
    @kmovie = Product.where(category_id:14)
    @etc = Product.where(category_id:15)
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
  end

  def category_find
    respond_to do |format| 
      parent = Category.find(params[:category_id])
      @children = parent.children
      format.json
    end
  end

  def show
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
  end

  def edit
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
  end

  def search
    @products = Product.search(params[:keyword])
  end

  private
  def product_params
    params.require(:product).permit(:title, :image, :text, :link, :category_id).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id]) 
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
end
