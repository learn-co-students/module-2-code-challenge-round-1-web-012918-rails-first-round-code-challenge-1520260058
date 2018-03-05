class CreateHeroPowers < ActiveRecord::Migration[5.0]
  def change
    create_table :hero_powers do |t|
      t.integer :superhero_id
      t.integer :superpower_id
      t.timestamps
    end
  end
end
