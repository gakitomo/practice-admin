class Admin::Authenticator
  def initialize(administrotor)
    @administrotor = administrotor
  end

  def authenticate(raw_password)
    @administrotor &&
      @administrotor.hashed_password &&
      BCrypt::Password.new(@administrotor.hashed_password) == raw_password
  end
end