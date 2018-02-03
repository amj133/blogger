require 'rails_helper'

describe "user sees one article" do
  describe "they link from article index" do
    it "displays individual article information" do
      article = Article.create(title: "Muffins", body: "Why muffins suck")

      visit "/articles"

      click_link(article.title)

      expect(current_path).to eq('/articles/1')
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end
