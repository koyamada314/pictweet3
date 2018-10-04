class CreateFootprints < ActiveRecord::Migration
  def change
    create_table :footprints do |t|
      t.integer :host_id, null: false
      t.integer :visitor_id, null: false
      t.timestamps null: false
    end
  end
end
