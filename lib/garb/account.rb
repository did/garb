module Garb
  class Account
    attr_reader :id, :name, :profiles

    def initialize(profiles)
      @id = profiles.first.account_id
      @name = profiles.first.account_name
      @profiles = profiles
    end

    def self.all(auth_token)
      Profile.all(auth_token).group_to_array{|p| p.account_id}.map{|profiles| new(profiles)}
    end
  end
end
