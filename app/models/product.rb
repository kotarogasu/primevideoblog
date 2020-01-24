class Product < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: {message: "titleを入力してください"},length: {maximum: 50, message: "50字以内で入力してください"}
  validates :text, presence: {message: "レビューを入力してください"},length:{maximum: 700, message: "700字以内で入力してください"}
  validates :link, presence: {message: "urlを入力してください"}
  validates :image, presence: {message: "画像パスを入力してください"}
  validates :category_id, presence: {message: "ジャンルを選んでください"}
  validates :tag_list, presence: {message: "タグを一つ以上入力してください"}
  
  belongs_to :user
  belongs_to :category, optional: true

  acts_as_taggable

  scope :recent10, -> { order(created_at: :desc).limit(10)}

  def self.search(search)
    return Product.all unless search
    Product.where('text LIKE(?) OR title LIKE(?)', "%#{search}%", "%#{search}%" )
    #ひらがな、カタカなでも検索可能 
  end
  

end
