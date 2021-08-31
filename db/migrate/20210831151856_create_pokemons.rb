class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|

      t.integer :number
      t.string :name, null: false
      t.string :type_1, null: false, :default => 'Normal'
      t.string :type_2
      t.integer :total, null: false, :default => 300
      t.integer :hp, null: false, :default => 50
      t.integer :attack, null: false, :default => 40
      t.integer :defense, null: false, :default => 40
      t.integer :sp_atk, null: false, :default => 60
      t.integer :sp_def, null: false, :default => 50
      t.integer :speed, null: false, :default => 50
      t.integer :generation, null: false, :default => 1
      t.boolean :legendary, null: false , :default => false

      t.timestamps
    end
  end
end
