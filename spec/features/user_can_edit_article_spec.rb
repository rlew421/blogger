require 'rails_helper'

describe "user edits an article" do
  describe "they link from a show page" do
    describe "they fill in an edit field" do
      it "submit displays the updated information on a show page" do
        article_1 = Article.create!(title: "Title 1", body: "Body 1")

        visit article_path(article_1)
        click_link "Edit"

        expect(current_path).to eq(edit_article_path(article_1))
        updated_title = "Updated Title!"
        updated_body = "Updated Body!"
        fill_in "article[title]", with: updated_title
        fill_in "article[body]", with: updated_body
        click_on "Update Article"
        expect(page).to have_content("Article #{updated_title} was updated.")
      end
    end
  end
end
