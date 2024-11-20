# spec/models/tag_spec.rb
require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject { Tag.new(name: "Ruby") }

  it "es válido con un nombre" do
    expect(subject).to be_valid
  end

  it "no es válido sin un nombre" do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it "no permite nombres duplicados" do
    Tag.create(name: "Ruby")
    expect(subject).not_to be_valid
  end

  it "puede estar asociado a múltiples artículos" do
    article1 = Article.create(title: "Artículo 1", body: "Contenido del artículo 1")
    article2 = Article.create(title: "Artículo 2", body: "Contenido del artículo 2")
    subject.articles << [article1, article2]
    expect(subject.articles).to include(article1, article2)
  end
end
