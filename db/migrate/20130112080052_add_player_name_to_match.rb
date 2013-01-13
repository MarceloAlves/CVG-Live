class AddPlayerNameToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :player1_name, :string
    add_column :matches, :player2_name, :string
  end
end
