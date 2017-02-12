class MemberPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.super_admin_or_admin? || user.has_role?(:agent)
  end

  def show?
    user.super_admin_or_admin? || (user.has_role?(:agent) && record.site.try(:user_id) == user.id)
  end

  def new?
    user.super_admin_or_admin? || user.has_role?(:agent)
  end

  def create?
    user.super_admin_or_admin? || (user.has_role?(:agent) && record.site.try(:user_id) == user.id)
  end

  def edit?
    create?
  end

  def update?
    edit?
  end

  def destroy?
    create?
  end

  def permitted_attributes_for_create
    if user.has_role?(:admin) || user.has_role?(:agent)
      [:user_id, :name, :qq, :email, :birth, :mobile_phone, :tel_phone, :wechat, :firm, :address, :note, :features]
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create - [:mobile_phone]
  end
end
