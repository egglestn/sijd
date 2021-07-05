class AddRecordEffects < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.string :name
      t.text :description
    end

    create_table :records do |t|
      t.integer :location
      t.integer :side
      t.integer :spreads

      t.references :condition

      t.timestamps
    end

    create_table :things do |t|
      t.string :name

      t.timestamps
    end

    create_table :medicines do |t|
      t.string :name

      t.timestamps
    end

    create_table :vitamins do |t|
      t.string :name

      t.timestamps
    end

    create_table :others do |t|
      t.string :name

      t.timestamps
    end

    create_join_table :things, :records do |t|
      t.integer :score

      t.references :thing, foreign_key: true
      t.references :record, foreign_key: true

      t.timestamps
    end

    create_join_table :medicines, :records do |t|
      t.integer :score
      t.integer :side_effects
      t.integer :diminishing

      t.references :medicine, foreign_key: true
      t.references :record, foreign_key: true

      t.timestamps
    end

    create_join_table :vitamins, :records do |t|
      t.integer :score
      t.integer :side_effects
      t.integer :diminishing

      t.references :vitamin, foreign_key: true
      t.references :record, foreign_key: true

      t.timestamps
    end

    create_join_table :others, :records do |t|
      t.integer :score
      t.integer :side_effects
      t.integer :diminishing
      t.integer :recovery

      t.references :other, foreign_key: true
      t.references :record, foreign_key: true

      t.timestamps
    end
  end
end
