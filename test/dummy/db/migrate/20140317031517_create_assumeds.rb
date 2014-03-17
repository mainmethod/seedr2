class CreateAssumeds < ActiveRecord::Migration
  def change
    create_table :assumeds do |t|
      t.string :username
      t.string :full_name
      t.string :fname
      t.string :lastname
      t.string :middle_initial
      t.string :email
      t.string :phone
      t.string :company
      t.string :not_assumed

      t.timestamps
    end
  end
end
