
    # require 'square'
class Order < ApplicationRecord
    # attr_accessor :purchased_id
    belongs_to :seller, class_name: "Truck", :foreign_key => "seller_id"
    belongs_to :purchaser, class_name: "User", :foreign_key => "purchaser_id"
    has_and_belongs_to_many :items,:join_table => "order_items"
    # square = Square::Client.new(access_token: 'YOUR ACCESS TOKEN')
    
    # response = square.customers.create_customer(body: new_customer)
    # new_customer = {
    #     given_name: 'Ava',
    #     address: {
    #       address_line_1: '555 Electric Ave',
    #       locality: 'Los Angeles',
    #       country: 'US'
    #     }
    #    }

    # if response.success?
    #     p response.data
    #   else
    #     warn response.errors
    #   end




end


