# frozen_string_literal: true

class GetContractorResource
  BASE_URL = ENV['BASE_URL']

  def initialize(resource_name:, resource_id: nil)
    @resource_name = resource_name
    @resource_id = resource_id
  end

  def call
    sanitized_response
  end

  private

  attr_reader :resource_name, :resource_id

  def sanitized_response
    JSON.parse(response.body, object_class: OpenStruct)
  end

  def response
    RestClient.get(resource_url, { accept: :json })
  end

  def resource_url
    "#{BASE_URL}/#{resource_name}/#{resource_id}".strip
  end
end
