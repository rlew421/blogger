require 'rails_helper'

describe "user edits an article" do
  describe "they link from a show page" do
    describe "they fill in an edit field" do
      it "submit displays the updated information on a show page" do
        article_1 = Article.create!(title: "Title 1", body: "Body 1")

        visit article_path(article_1)
        click_link "Edit"

        expect(current_path).to eq(edit_article_path(article_1))
        fill_in "article[title]", with: "Updated Title!"
        fill_in "article[body]", with: "Udpated Body!"
        click_on "Update Article"
      end
    end
  end
end
