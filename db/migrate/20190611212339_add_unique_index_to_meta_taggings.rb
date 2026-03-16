class AddUniqueIndexToMetaTaggings < ActiveRecord::Migration[5.1]
  def change
    add_index :meta_taggings, [:meta_tag_id, :sub_tag_id], unique: true
  end
end
