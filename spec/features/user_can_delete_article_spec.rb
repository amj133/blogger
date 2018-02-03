require 'rails_helper'

describe "user can delete an article" do
  describe "they link from the show page" do
    it "displays all articles without the deleted entry" do
      article_1 = Article.create!(title: "Birds", body: "Birds can fly")
      article_2 = Article.create!(title: "Ostriches", body: "Ostriches cannot fly")

      expect(Article.count).to eq(2)

      visit article_path(article_1)
      click_on('delete')

      expect(current_path).to eq(articles_path)
      expect(Article.count).to eq(1)
      expect(page).to have_content(article_2.title)
      expect(page).to have_content("Article '#{article_1.title}' Deleted!")
    end
  end
end
