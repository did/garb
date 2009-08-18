module Garb
  class Session

    # this time, just returns a token that developpers should keep warm
    def self.login(email, password, opts={})
      auth_request = AuthenticationRequest.new(email, password)
      auth_request.auth_token(opts)
    end

  end
end
