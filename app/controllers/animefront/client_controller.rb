module Animefront
  class ClientController < ApplicationController
    include Pundit::Authorization

    def policy_scope(scope)
      super([:animefront, scope])
    end

    def authorize(record, query = nil)
      super([:animefront, record], query)
    end
  end
end
