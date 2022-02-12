# frozen_string_literal: true

class HutchClient
  def initialize(event:, params:)
    @event = event
    @params = params
  end

  def notify
    Hutch.publish(event, params)
  end

  private

  attr_reader :event, :params
end
