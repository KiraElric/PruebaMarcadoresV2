class Bookmark < ApplicationRecord
  belongs_to :category
  belongs_to :type

  validates :url, presence: true

  def category_name
    self.category.name
  end

  def type_name
    self.type.name
  end
end
