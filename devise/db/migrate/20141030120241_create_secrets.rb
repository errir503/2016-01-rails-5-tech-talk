class CreateSecrets < ActiveRecord::Migration
  def change
    create_table :secrets do |t|
      t.text :text
      t.references :user

      t.timestamps
    end
  end
end
