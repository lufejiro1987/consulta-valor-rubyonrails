class CreateQueries < ActiveRecord::Migration[6.0]
  def change
    create_table :queries do |t|
      t.string :client
      t.date :uf_date

      t.timestamps
    end
  end
end
