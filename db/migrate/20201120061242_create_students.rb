class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :year_of_birth
      t.string :gender
      t.string :address
      t.string :fathers_name
      t.string :mothers_name

      t.timestamps
    end
  end
end
