class Driver < ApplicationRecord
  validates :name, :last_name, :code, presence: true
  validates_uniqueness_of :code
  validate :invalid_code

  def full_name
    "#{self.name} #{self.last_name}"
  end

  def valid_code?
    self.code.size >= 3
  end

  private

  def invalid_code
    errors.add(:invalid_code, 'Code too short') unless valid_code?
  end
end
