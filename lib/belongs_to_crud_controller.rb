class BelongsToCrudController < CrudController

  before_filter :find_parent

  def index
    instance_variable_set("@#{controller_name.pluralize}", get_parents_children)
  end

  def create
    set_singular(current_model.new(params_hash))
    if get_singular.save
      get_parents_children << get_singular
      redirect_to [get_parent, get_singular]
    else
      render :action => :new
    end
  end
  
  protected
  
    def options_for_redirect(opts={})
      {:"#{parent_model.to_s.downcase}_id" => get_parent.id}.merge(opts)
    end

  private
  
    def self.parent_model(klass)
      self.class_eval <<-EOS
        def parent_model
          #{klass}
        end
        private :parent_model
      EOS
    end

    def find_parent
      set_parent(parent_model.find(params[:"#{parent_model.table_name.singularize}_id"]))
    end

    def set_parent(rvalue)
      instance_variable_set("@#{parent_model.table_name.singularize}", rvalue)
    end

    def get_parent
      instance_variable_get("@#{parent_model.table_name.singularize}")
    end

    def get_parents_children
      get_parent.send(controller_name.pluralize.to_sym)
    end
end
