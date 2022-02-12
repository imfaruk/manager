# frozen_string_literal: true

class Notifier
  def initialize(event:, params:, client: nil)
    @client = client || HutchClient.new(event: event, params: params)
  end

  def notify
    client.notify
  end

  private

  attr_reader :client
end
