class ReflectionPolicy
  attr_reader :user, :reflection

  def initialize(user, reflection)
    @user = user
    @reflection = reflection
  end

  def create?
  end

  def update?
    @user.account.admin? || @reflection.account == @user.account
  end

  def edit?
    update?
  end
end