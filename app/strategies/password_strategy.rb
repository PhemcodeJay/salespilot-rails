# app/strategies/password_strategy.rb
Warden::Strategies.add(:password) do
    def valid?
      params['email'] && params['password']
    end
  
    def authenticate!
      user = User.find_by(email: params['email'])
  
      if user&.valid_password?(params['password'])
        success!(user)
      else
        fail!('Invalid email or password')
      end
    end
  end
  