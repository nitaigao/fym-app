class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.belongs_to :user, index: true
    	t.string :mask
      t.timestamps null: false
    end
  end
end
