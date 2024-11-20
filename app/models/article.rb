# app/models/article.rb
class Article < ApplicationRecord
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags

  validates :title, presence: true
  validates :body, presence: true
end
