# frozen_string_literal: true

module Macaddr::Self
  module_function

  def call
    `ip a | grep ether`
      .split("\n")
      .select { |e| e.include?('b8:27:eb') }
      .map { |e| e.split[1] }
      .first || 'xx:xx:xx:xx:xx:xx'
  end
end
