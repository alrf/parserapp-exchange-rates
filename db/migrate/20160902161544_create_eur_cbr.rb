class CreateEurCbr < ActiveRecord::Migration[5.0]
  def change
    create_table :eur_cbrs do |t|
      t.date :date
      t.text :value
      t.text :change
    end
  end
end
