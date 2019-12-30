
require 'net/http'
class PaymentsController < ApplicationController
    def create
        payload = {
          "source_id": params[:nonce],
          "verification_token": params[:token],
          "autocomplete": true,
          "location_id":  "#{Rails.application.credentials[:square][:location_id]}",
          "amount_money": { # amount_money = $1.00
            "amount": params[:amount],
            "currency": "USD"
          },
          "idempotency_key": SecureRandom.uuid
        }
        # api_client = Square::Client.new(
        #     access_token: "Bearer #{Rails.application.credentials[:square][:access_key]}",
        #     environment: ENV['IS_PRODUCTION'] == 'false' ? 'sandbox' : 'production'
        #   )
        #   resp = api_client.payments.create_payment(body: payload)
        #   
        # end
        client = Square::Client.new(
            access_token: "#{Rails.application.credentials[:square][:access_key]}",
            environment: 'sandbox'
          )
        payments_api = client.payments
        result = payments_api.create_payment(body: payload)
          if result.status_code == 200
           render json: {message: "Payment Complete"}, :status => :accepted
          end
        
        
        # url = "https://connect.squareupsandbox.com/v2/payments"
        # res = Net::HTTP::Post.new(url, body: payload.to_json())
        # render json: res.body
      end
end
