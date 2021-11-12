class AddPetIdToPetHistories < ActiveRecord::Migration[6.1]
  def change
    add_reference :pet_histories, :pet, null: false, foreign_key: true
  end
end
