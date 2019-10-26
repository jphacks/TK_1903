# frozen_string_literal: true

class TurnoffLedJob < ApplicationJob
  queue_as :default

  def perform
    # TODO: 実際に使うピン番号に変える
    raise NotyetImplementError

    `gpio write #{blue_led_pin} 0`
    `gpio write #{red_led_pin} 0`
    `gpio write #{indicater1_pin} 0`
    `gpio write #{indicater2_pin} 0`
    `gpio write #{indicater3_pin} 0`
    `gpio write #{indicater4_pin} 0`
    `gpio write #{indicater5_pin} 0`
  end

  class NotyetImplementError < StandardError; end
end
