class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  after_update :set_sync_flag

  def set_sync_flag
    update_column(:synchronized, false)
  end
end
