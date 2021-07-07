class Type < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  validates :name, presence: true
end
