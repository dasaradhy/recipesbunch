class RecipePolicy < ApplicationPolicy

  def index?
    true
  end

  def new?
    @user.present?
  end

  def edit?
    @user.chef.present? && record.chef == @user.chef
  end

  def show?
    true
  end

  def create?
    new?
  end

  def update?
    @user.chef.present? && record.chef == @user.chef
  end

end