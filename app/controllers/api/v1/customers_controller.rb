class Api::V1::CustomersController < ApplicationController


    def create
        @customer = Customer.create(customer_params)
        if @customer.valid?
          render json: ({ customer: @customer), status: :created)
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end
      private
      def customer_params
        params.require(:customer).permit(:firstName, :lastName, :email, :username, :password, )
    end

end
