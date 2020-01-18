class Product < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  
  validates :text, presence: true
  belongs_to :user
  belongs_to :category, optional: true

  def self.search(search)
    return Product.all unless search
    Product.where('text collate utf8_unicode_ci LIKE(?) OR title collate utf8_unicode_ci LIKE(?)', "%#{search}%", "%#{search}%" )
    #ひらがな、カタカなでも検索可能 
  end

end
