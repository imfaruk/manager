# frozen_string_literal: true

class PaymentRequestsController < ApplicationController
  def index
    @payment_requests = GetContractorResource.new(
      resource_name: 'payment_requests'
    ).call
  end

  def show
    @payment_request = GetContractorResource.new(
      resource_name: 'payment_requests',
      resource_id: params[:id]
    ).call
  end

  def update
    Notifier.new(
      event: 'payment_request_status_update',
      params: { id: params[:id], status: params[:status] }
    ).notify

    flash[:notice] = 'Your request is being processed'
    redirect_to payment_requests_path
  end
end
