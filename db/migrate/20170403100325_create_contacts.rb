class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.column :name, :string
      t.column  :phone, :string
      t.column :user_id, :integer
      
      t.timestamps
    end
  end
end
