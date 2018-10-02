class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.bigint :owner_id
      t.bigint :sender_id
      t.references :home, foreign_key: true

      t.timestamps
    end
  end
end
