class AddUsersToAuditLog < ActiveRecord::Migration
  def change
    add_column :audit_logs, :auditor_id, :integer
  end
end
