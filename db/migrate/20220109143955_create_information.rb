class CreateInformation < ActiveRecord::Migration[6.1]
  def change
    create_table :information do |t|
      t.string :height
      t.string :weight
      t.string :imc
      t.string :classification
      t.string :obesity

      t.timestamps
    end
  end
end
