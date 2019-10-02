class CreateUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :updates do |t|
      t.string :content
        t.timestamps
    end
  end
end
