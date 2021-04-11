class HousePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def index?
    @user.has_role?(:volunteer)
  end
  def show?
    @user.has_role?(:volunteer)
  end
    
  def edit?
    @user.present? && @record.user == @user || @user.present? && @user.has_role?(:admin) 
  end

  def update?
    @user.present? && @record.user == @user || @user.present? && @user.has_role?(:admin)
  end

  
  def destroy?
    @user.present? && @record.user == @user || @user.present? && @user.has_role?(:admin)
  end
  
  
  def new?
    @user.has_role?(:volunteer) 
  end

  def create?
    @user.has_role?(:volunteer)
  end
  
  
end
