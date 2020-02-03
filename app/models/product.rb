class Product < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  VALID_URL_REGEX = /https?:\/\/[\w\/:%#\$&\?\(\)~\.=\+\-]+|\A\z/

  validates :title, presence: {message: "titleを入力してください"},length: {maximum: 40, message: "40字以内で入力してください"}
  validates :text, presence: {message: "レビューを入力してください"},length:{maximum: 500, message: "500字以内で入力してください"}
  validates :link, presence: {message: "urlを入力してください"},format: { with: VALID_URL_REGEX, message: '正しいURLを入力してください' }
  validates :image, presence: {message: "画像パスを入力してください"}
  validates :category_id, presence: {message: "ジャンルを選んでください"}
  validates :tag_list, presence: {message: "タグを一つ以上入力してください"}
  
  belongs_to :user
  belongs_to :category, optional: true
  has_many :acter_products
  has_many :acters, through: :acter_products


  acts_as_taggable

  scope :recent10, -> { order(created_at: :desc).limit(3)}

  if Rails.env.development? 
    def self.search(search)
      return Product.all unless search
      Product.where('text collate utf8_unicode_ci LIKE(?) OR title collate utf8_unicode_ci LIKE(?) OR acter collate utf8_unicode_ci LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%")
      #ひらがな、カタカなでも検索可能 
    end
  end

  if Rails.env.production? 
    def self.search(search)
      return Product.all unless search
      Product.where('text ILIKE(?) OR title ILIKE(?) OR acter ILIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%")
    
    end
  end
  
  Product.tagged_with([params[:search_tag]], :any => true)...

end


