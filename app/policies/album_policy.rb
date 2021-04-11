class AlbumPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
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
  
  
end
