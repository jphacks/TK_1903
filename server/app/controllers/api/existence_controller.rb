# frozen_string_literal: true

class Api::ExistenceController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    if params[:exist].to_i.zero?
      turnoff_leds
    else
      turnon_leds
    end

    render json: { message: 'OK' }, status: :ok
  end

  private

  def turnon_leds
    `gpio write #{Rails.application.credentials.gpio[:blue]} 1`
    `gpio write #{Rails.application.credentials.gpio[:red]} 1`
    `gpio write #{Rails.application.credentials.gpio[:indicater][0]} 1`
    `gpio write #{Rails.application.credentials.gpio[:indicater][1]} 1`
    `gpio write #{Rails.application.credentials.gpio[:indicater][2]} 1`
    `gpio write #{Rails.application.credentials.gpio[:indicater][3]} 1`
    `gpio write #{Rails.application.credentials.gpio[:indicater][4]} 1`
  end

  def turnoff_leds
    `gpio write #{Rails.application.credentials.gpio[:blue]} 0`
    `gpio write #{Rails.application.credentials.gpio[:red]} 0`
    `gpio write #{Rails.application.credentials.gpio[:indicater][0]} 0`
    `gpio write #{Rails.application.credentials.gpio[:indicater][1]} 0`
    `gpio write #{Rails.application.credentials.gpio[:indicater][2]} 0`
    `gpio write #{Rails.application.credentials.gpio[:indicater][3]} 0`
    `gpio write #{Rails.application.credentials.gpio[:indicater][4]} 0`
  end
end
