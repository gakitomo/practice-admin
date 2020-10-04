class Staff::CustomersController < Staff::Base
  def index
    @customers = Customer.order(:family_nama_kana, :given_name_kana).page(params[:page])
  end
end
