class CreateEurCbr < ActiveRecord::Migration[5.0]
  def change
    create_table :eur_cbrs do |t|
      t.date :date, :null => false
      t.text :value, :default => 0, :null => false
      t.text :change, :default => 0, :null => false
    end
  end
end
