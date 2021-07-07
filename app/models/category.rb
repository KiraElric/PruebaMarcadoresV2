class Category < ApplicationRecord
  has_many :bookmarks,  dependent: :destroy
  has_many :subcategories, class_name: "Category", foreign_key: "parent_category", dependent: :destroy
  belongs_to :parent, class_name: "Category", optional: true
  validates :name, presence: true

  def parent_category_name
    parent_id = self.parent_category
    if parent_id != nil 
      return Category.find(parent_id).name
    else
      return 'N/A'
    end
  end
end
