# spec/models/article_tag_spec.rb
require 'rails_helper'

RSpec.describe ArticleTag, type: :model do
  let(:article) { Article.create(title: "Artículo de prueba", body: "Contenido del artículo") }
  let(:tag) { Tag.create(name: "Prueba") }
  subject { ArticleTag.new(article: article, tag: tag) }

  it "es válido con un artículo y un tag" do
    expect(subject).to be_valid
  end

  it "no es válido sin un artículo" do
    subject.article = nil
    expect(subject).not_to be_valid
  end

  it "no es válido sin un tag" do
    subject.tag = nil
    expect(subject).not_to be_valid
  end
end
