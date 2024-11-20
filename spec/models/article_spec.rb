# spec/models/article_spec.rb
require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:tag1) { Tag.create(name: "Ruby") }
  let(:tag2) { Tag.create(name: "Rails") }
  subject { Article.new(title: "Aprender Rails", body: "Contenido sobre Rails.") }

  it "es válido con un título y cuerpo" do
    expect(subject).to be_valid
  end

  it "no es válido sin un título" do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it "no es válido sin un cuerpo" do
    subject.body = nil
    expect(subject).not_to be_valid
  end

  it "puede tener múltiples tags asociados" do
    subject.tags << [tag1, tag2]
    expect(subject.tags).to include(tag1, tag2)
  end
end
