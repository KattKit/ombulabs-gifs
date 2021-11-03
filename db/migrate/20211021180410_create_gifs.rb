class CreateGifs < ActiveRecord::Migration[6.1]
  def change
    create_table :gifs do |t|
      t.references :users

      t.timestamps
    end
  end
end
