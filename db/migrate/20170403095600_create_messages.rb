class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.column :from, :string
      t.column :to, :string
      t.column :body, :string
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
