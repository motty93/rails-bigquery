class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  after_update :set_sync_flag

  def set_sync_flag
    update(synchronized: false)
  end
end
