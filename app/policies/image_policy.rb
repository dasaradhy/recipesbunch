class ImagePolicy < ApplicationPolicy
  
  def create?
    @user.present?
  end

  def get_image?
    @user.present?
  end

end