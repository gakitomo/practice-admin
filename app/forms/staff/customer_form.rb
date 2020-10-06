class Staff::CustomerForm
  include Activemodel::model
    attr_accessor :customer

    def initialize(customer = nil)
      @customer = customer
      @customer || = Customer.new(gender: "male")
      @customer.build_home_address unless @customer.home_address
      @customer.build_home_address unless @customer.work_address
    end
  end
end