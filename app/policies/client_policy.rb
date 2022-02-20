# frozen_string_literal: true

class ClientPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user&.otaku?
  end

  def show?
    user&.otaku?
  end

  def create?
    user&.otaku?
  end

  def new?
    create?
  end

  def update?
    user&.otaku?
  end

  def edit?
    update?
  end

  def destroy?
    user&.otaku?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
