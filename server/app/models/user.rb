# frozen_string_literal: true

class User < ApplicationRecord
  before_validation :set_macaddr
  validates :macaddr, uniqueness: true, presence: true

  private

  def set_macaddr
    self.macaddr ||= Macaddr::Self.call
  end
end
