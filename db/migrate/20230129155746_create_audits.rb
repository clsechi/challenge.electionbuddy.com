class CreateAudits < ActiveRecord::Migration[6.1]
  def change
    create_table :audits do |t|
      t.json :audited_changes, null: false
      t.integer :auditable_id
      t.string :auditable_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :audits, [:auditable_id, :auditable_type]
  end
end
