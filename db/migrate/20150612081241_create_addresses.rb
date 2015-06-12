class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.references :user
    	t.string :email
      t.timestamps null: false
    end
  end
end
