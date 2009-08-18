require File.join(File.dirname(__FILE__), '..', '/test_helper')

module Garb
  class SessionTest < Test::Unit::TestCase
    
    context "The Session class" do
      
      should "be able retrieve an auth_token for a user" do
        auth_request = mock { |m| m.expects(:auth_token).with({}).returns('toke') }
        AuthenticationRequest.expects(:new).with('email', 'password').returns(auth_request)

        token = Session.login('email', 'password')
        assert_equal 'toke', token
      end

      should "be able retrieve an auth_token for a user with secure ssl" do
        auth_request = mock {|m| m.expects(:auth_token).with({:secure => true}).returns('toke') }
        AuthenticationRequest.expects(:new).with('email', 'password').returns(auth_request)
      
        token = Session.login('email', 'password', :secure => true)
        assert_equal 'toke', token
      end
            
    end

  end
end
