class CreatePetHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_histories do |t|
      t.float :weight
      t.string :height
      t.string :description

      t.timestamps
    end
  end
end
