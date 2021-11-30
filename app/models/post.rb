class Post < ApplicationRecord
  belongs_to :conversation
  belongs_to :author, polymorphic: true
  has_rich_text :body

  validates :body, presence: :true
end
