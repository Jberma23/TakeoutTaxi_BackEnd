require 'byebug'
class PaymentsController < ApplicationController
    def create
        byebug
        payload = {
          "source_id": params[:nonce],
          "verification_token": params[:token],
          "autocomplete": true,
          "location_id":  Rails.application.credentials[:square][:location_id],
          "amount_money": { # amount_money = $1.00
            "amount": 100,
            "currency" "USD"
          },
          "idempotency_key": SecureRandom.uuid
        }
        url = "https://connect.squareupsandbox.com/v2/payments"
        res = HTTP.auth("Bearer #{EAAAEJcUiT6PwB246Cq9LX4dvHs9vBhhxtgaJ6D0Bfw45vCN-TKza27srR5zWtwt}").post(url, :body => payload.to_json)
        render json: res.body
      end
end
