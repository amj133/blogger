require 'rails_helper'

describe "user can create new article" do
  describe "they link from the article index" do
    describe "they fill in a title and body" do
      it "can create a new article" do
        visit articles_path
        click_link('Create a New Article')

        expect(current_path).to eq(new_article_path)

        fill_in('Title', :with => "Cows")
        fill_in('Body', :with => "Cows are amazing creatures!")
        click_on('Create Article')
        new_article = Article.find(1)
        # new_article = Article.find(1)
        #
        # expect(Article.count).to eq(1)
        # expect(current_path).to eq(article_path)
        expect(page).to have_content("Cows")
        expect(page).to have_content("Cows are amazing creatures!")
        expect(page).to have_content("Article '#{new_article.title}' Created!")
      end
    end
  end
end
