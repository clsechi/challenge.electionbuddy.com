class Audit < ApplicationRecord
  belongs_to :auditable, polymorphic: true
  belongs_to :user

  attribute :audited_user

  serialize :audited_changes, Hash
end
