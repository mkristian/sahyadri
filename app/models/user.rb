class User < Ixtlan::Models::User

  def self.repository(name = nil, &block)
    super(:default, &block)
  end

end
