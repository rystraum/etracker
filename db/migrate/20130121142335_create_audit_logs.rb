class CreateAuditLogs < ActiveRecord::Migration
  def change
    create_table :audit_logs do |t|
      t.references :unit
      t.string :state
      t.text :comments

      t.timestamps
    end
    add_index :audit_logs, :unit_id
  end
end
