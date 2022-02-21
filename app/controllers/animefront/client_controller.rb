module Animefront
  class ClientController < ApplicationController
    layout "animefront/layouts/application"

    include Pundit::Authorization

    def policy_scope(scope)
      super([:animefront, scope])
    end

    def authorize(record, query = nil)
      super([:animefront, record], query)
    end
  end
end
