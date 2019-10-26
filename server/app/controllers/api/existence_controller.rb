# frozen_string_literal: true

class Api::ExistenceController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    return if params[:exist].to_i.zero?

    turnon_leds
    TurnoffLedJob.set(wait: 1.seconds).perform_later
    render json: { message: 'OK' }, status: :ok
  end

  private

  def turnon_leds
    `gpio write #{blue_led_pin} 1`
    `gpio write #{red_led_pin} 1`
    `gpio write #{indicater1_pin} 1`
    `gpio write #{indicater2_pin} 1`
    `gpio write #{indicater3_pin} 1`
    `gpio write #{indicater4_pin} 1`
    `gpio write #{indicater5_pin} 1`
  end
end
