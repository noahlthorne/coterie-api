class OrganizationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  
  def show?
    true
  end

  def update?
    true
    # p user.
    # record.users.find(user) == user && user.admin == true
  end
end