require 'rails_helper'

describe "user sees all articles" do
  describe "they visit /articles" do
    it "displays all articles" do
      article_1 = Article.create(title: "Title_1", body: "Body_1")
      article_2 = Article.create(title: "Title_2", body: "Body_2")

      visit "/articles"

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_2.title)
    end
  end
end
