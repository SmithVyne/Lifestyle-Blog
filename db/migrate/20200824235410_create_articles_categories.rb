class CreateArticlesCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :articles_categories do |t|
      t.references :article
      t.references :category

      t.timestamps
    end
  end
end
