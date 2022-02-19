module Animefront
  class ClientController < ApplicationController
    include Pundit::Authorization

    def policy_scope(scope)
      super([:admin, scope])
    end

    def authorize(record, query = nil)
      super([:admin, record], query)
    end
  end
end
