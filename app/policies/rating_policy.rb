class RatingPolicy < ApplicationPolicy

  def index?
    true
  end

  def new?
    user.present?
  end

  def edit?
    user.present? && record.user == user
  end

  def show?
    true
  end

  def create?
    new?
  end

  def update?
    edit?
  end

end