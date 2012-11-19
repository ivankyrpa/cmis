module UsersHelper
  def type_by_id(integer)
    UserType.find(integer).name unless UserType.find(integer).nil?
  end
end
