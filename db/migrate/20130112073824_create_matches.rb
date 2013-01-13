class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :id
      t.string :identifier
      t.integer :player1_id
      t.integer :player2_id
      t.integer :round
      t.string :state
      t.integer :tournament_id
      t.integer :winner_id
      t.string :scores_csv

      t.timestamps
    end
  end
end
