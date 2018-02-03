require 'rails_helper'

describe "user can edit an article" do
  describe "user is linked from show page" do
    it "can edit article information" do
      article_1 = Article.create!(title: "title", body: "body")

      visit article_path(article_1)
      click_on('Edit')

      expect(current_path).to eq(edit_article_path(article_1))
      fill_in('Title', :with => 'Gorillas')
      fill_in('Body', :with => 'Gorillas are awesome!')
      click_on('Update Article')
      edited_article = Article.find(1)

      expect(current_path).to eq(article_path(article_1))
      expect(page).to have_content('Gorillas')
      expect(page).to have_content('Gorillas are awesome!')
      expect(page).to_not have_content('title')
      expect(page).to_not have_content('body')
      expect(edited_article.title).to eq('Gorillas')
      expect(page).to have_content("Article '#{edited_article.title}' Updated!")
    end
  end
end
