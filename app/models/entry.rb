class Entry < ActiveRecord::Base
  belongs_to :entry_type

  validates :name, :amount, :entry_type_id, presence: true

  delegate :name, to: :type, prefix: true

  before_validation :set_name

  def type
    entry_type
  end

  def set_name
    self.name ||= type.name
  end
end
