module RightsHelper
  # Simplified permission block
  def edit_authorized?(owner, &block)
    current_user == owner ? yield : return
  end
end