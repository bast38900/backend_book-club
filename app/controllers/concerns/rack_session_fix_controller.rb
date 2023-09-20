# Rails API-only app, sessions are disabled by default, but devise relies on sessions to function.
# Before Rails 7, sessions were passed as a hash, so even if they were disabled,
# devise could still write into a session hash.Now, the session is an ActionDispatch::Session object,
# which is not writable on Rails API-only apps, because the ActionDispatch::Session is disabled.
# more: https://github.com/heartcombo/devise/issues/5443
module RackSessionFixController
  extend ActiveSupport::Concern

  # FIX: ActionDispatch::Request::Session::DisabledSessionError
  # Create a fake session hash
  class FakeRackSession < Hash
    def enabled?
      false
    end
  end

  included do
    before_action :set_fake_rack_session_for_devise

    private

    def set_fake_rack_session_for_devise
      request.env['rack.session'] ||= FakeRackSession.new
    end
  end
end
