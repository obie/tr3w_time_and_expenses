class ActiveRecord::Associations::BelongsToAssociation
  
  def replace_with_before_assignment_callback(new_value)
    before_assignment(new_value) if self.respond_to? :before_assignment
    replace_without_before_assignment_callback(new_value)
  end
  
  alias_method_chain :replace, :before_assignment_callback
  
end