class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :details, :update]
  # before_action :category_type, only:[:index, :category_show]
  before_action :authenticate_user!, only: [:post]

  def post
    @product = Product.new
  end


  def index
    @toptags = ActsAsTaggableOn::Tag.most_used(4)
    @movie = Category.find(1)
    @tv = Category.find(14)
    @choice = [@movie,@tv]
    if  params[:id] == "14"
      @categories = Category.where(id:15..20).includes(:products)
    else  params[:id] == "1"
      @categories = Category.where(id:2..13).includes(:products)
    end
  end
  
 

  def category_show
    category = Category.find(params[:id])
    @cate_name = category.name
    @products = category.products

    # @category = Category.all.includes(:products)
  end  

  
  def create
    @product = Product.new(product_params)
    if @product.save
        if @product[:category_id] <= 13  
          redirect_to root_path, notice: '投稿に成功しました'
        else @product[:category_id] >= 14
          redirect_to product_path(14), notice: '投稿に成功しました'
        end
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :post
    end
  end

  def category_find
    respond_to do |format| 
      @parent = Category.find(params[:category_id])
      @children = @parent.children
      format.json
    end
  end

  def details
    @tag = @product.tag_list
  end

  def tags_index
    @product = Product.all
    @tag = params[:tag_name]
      if params[:tag_name]
        @products = @product.tagged_with("#{params[:tag_name]}")
      end
  end

  def tag_search
    if params[:id] == "1"
      @tags = Product.tag_counts_on(:tags).order('count DESC')
    elsif params[:id] == "2"
      @movie = Product.where(category_id: 1..13) 
      @tags = @movie.tag_counts_on(:tags).order('count DESC')
    else params[:id] == "3"
      @tv = Product.where(category_id: 14..20)  
      @tags = @tv.tag_counts_on(:tags).order('count DESC')
    end
  end
    
  def destroy
    product = Product.find(params[:id])
    product.destroy
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      if @product[:category_id] <= 13  
        redirect_to root_path, notice: '投稿に成功しました'
      else @product[:category_id] >= 14
        redirect_to product_path(14), notice: '投稿に成功しました'
      end
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :edit
    end
  end

  def search
    @products = Product.search(params[:keyword])
  end

  private
  def product_params
    params.require(:product).permit(:title, :image, :text, :link, :category_id, :tag_list).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id]) 
  end

  # def category_type
  #   @action = Product.where(category_id:2).recent10
  #   @sf = Product.where(category_id:3).recent10
  #   @comedy = Product.where(category_id:4).recent10
  #   @human = Product.where(category_id:5).recent10
  #   @fantasy = Product.where(category_id:6).recent10
  #   @lovestory = Product.where(category_id:7).recent10
  #   @horror = Product.where(category_id:8).recent10
  #   @musical= Product.where(category_id:9).recent10
  #   @war = Product.where(category_id:10).recent10
  #   @jmovie = Product.where(category_id:11).recent10
  #   @kmovie = Product.where(category_id:12).recent10
  #   @metc = Product.where(category_id:13).recent10
  #   @drama = Product.where(category_id:15).recent10
  #   @wdrama = Product.where(category_id:16).recent10
  #   @tvcomedy = Product.where(category_id:17).recent10
  #   @korea = Product.where(category_id:18).recent10
  #   @anime = Product.where(category_id:19).recent10
  #   @tvetc = Product.where(category_id:20).recent10
  # end
  
end
