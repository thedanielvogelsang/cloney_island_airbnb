class Permission

  def initialize(user = nil, controller, action)
    @user = user || User.new
    @controller = controller
    @action = action
  end

  def authorized?
    if user.admin?
      admin_permissions
    elsif user.host?
      host_permissions
    elsif user.traveler?
      traveler_permissions
    else
      return true #change this to false when we're ready to utilize permissions
    end
  end

  private
    attr_reader :user, :controller, :action

    def traveler_permissions
      return true
    end

    def host_permissions
      return true
    end

    def admin_permissions
      return true
    end

end
