module Auditable
  extend ActiveSupport::Concern

  included do
    has_many :audits, as: :auditable

    after_commit :create_audit, on: [:update]
  end

  def create_audit
    return unless filtered_changes.present?

    audits.create!({
                     audited_changes: filtered_changes,
                     user: find_user
                   })
  end

  def find_user
    Current.audited_user
  end

  def filtered_changes
    changes = saved_changes.to_h

    @filtered_changes ||= changes.reject { |k| k == 'updated_at' }
  end
end
