class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :details, :update]
  # before_action :category_type, only:[:index, :category_show]
  before_action :authenticate_user!, only: [:post]

  require 'open-uri' #URLにアクセスする為のライブラリを読み込みます。
  require 'nokogiri' #Nokogiriライブラリを読み込みます。

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
    @products = category.products.order("created_at DESC").page(params[:page]).per(8)

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
        @products = @product.tagged_with("#{params[:tag_name]}").order("created_at DESC").page(params[:page]).per(8)
      end
  end

  def tag_search
    case
    when params[:id] == "1"
      @tags = Product.tag_counts_on(:tags).order('count DESC').page(params[:page]).per(35)
    when params[:id] == "2"
      @movie = Product.where(category_id: 1..13) 
      @tags = @movie.tag_counts_on(:tags).order('count DESC').page(params[:page]).per(35)
    when params[:id] == "3"
      @tv = Product.where(category_id: 14..20)  
      @tags = @tv.tag_counts_on(:tags).order('count DESC').page(params[:page]).per(35)
    when params[:id] == "4"
      @tag_search = Product.tagged_with(params[:tag_name],:any => true, :wild => true)
      @tags = @tag_search.tag_counts_on(:tags).order('count DESC').page(params[:page]).per(35)
      if params[:tag_name].empty?
       @tags = Product.tag_counts_on(:tags).order('count DESC').page(params[:page]).per(35)
      end
    end
  end
    
  def destroy
    product = Product.find(params[:id])
    if product.destroy
      if product[:category_id] <= 13  
        redirect_to root_path, notice: '削除に成功しました'
      else product[:category_id] >= 14
        redirect_to product_path(14), notice: '削除に成功しました'
      end
    else
      flash.now[:alert] = '削除に失敗しました'
      render :edit
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      if @product[:category_id] <= 13  
        redirect_to root_path, notice: '編集に成功しました'
      else @product[:category_id] >= 14
        redirect_to product_path(14), notice: '編集に成功しました'
      end
    else
      flash.now[:alert] = '編集に失敗しました'
      render :edit
    end
  end

  def search
    @products = Product.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(8)
  end

  private
  def product_params
    url = params.require(:product)[:link] #切り出すURLを指定します。
    if url.present?
      opt = {}
      opt['User-Agent'] = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/530.5 (KHTML, like Gecko) Chrome/2.0.172.33 Safari/530.5'
      charset = nil
      html = open(url,opt) do |f|
        charset = f.charset #文字種別を取得します。
        f.read #htmlを読み込み変数htmlに渡します。
      end
      doc = Nokogiri::HTML.parse(html, nil, charset) #htmlを解析し、オブジェクト化
      title = doc.css("._2Q73m9._2Q73m9._2Q73m9")
      img = doc.css(".av-page-desktop ._2a7NJV._2a7NJV._2a7NJV img")[0][:src]
      acter = doc.css("._33ixDQ")
      # subacter = doc.css("#btf-product-details ._33ixDQ")
      params.require(:product)[:title] = title.text
      params.require(:product)[:image] = img
      params.require(:product)[:acter] = acter.text
      # params.require(:product)[:subacter] = subacter.text
    end
    params.require(:product).permit(:title, :image, :text, :link, :category_id, :tag_list, :acter).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id]) 
  end

end
