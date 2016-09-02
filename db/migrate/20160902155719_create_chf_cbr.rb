class CreateChfCbr < ActiveRecord::Migration[5.0]
  def change
    create_table :chf_cbrs do |t|
      t.date :date
      t.text :value
      t.text :change
    end
  end
end
