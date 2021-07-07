class Type < ApplicationRecord
  has_many :bookmarks
  validates :name, presence: true
end
