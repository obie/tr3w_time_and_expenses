class CrudController < ApplicationController

  before_filter :find_object, :only => [:show, :edit, :update, :destroy]

  def index
    instance_variable_set("@#{controller_name.pluralize}", current_model.find(:all))
  end

  def new
    set_singular(current_model.new)
  end

  def create
    set_singular(current_model.new(params_hash))
    if get_singular.save
      redirect_to options_for_redirect(:action => :show, :id => get_singular.id)
    else
      render :action => :new
    end
  end

  def show; end

  def edit; end

  def update
    if get_singular.update_attributes(params_hash)
      redirect_to options_for_redirect(:action => :show, :id => get_singular.id)
    else
      render :action => :edit
    end
  end

  def destroy
    get_singular.destroy
    redirect_to options_for_redirect(:action => :index)
  end
  
  protected
  
    def options_for_redirect(opts={})
      opts
    end

  private

    def find_object
      set_singular(current_model.find(params[:id]))
    end

    def current_model
      Object.const_get controller_name.singularize.classify
    end

    def params_hash
      params[controller_name.singularize.to_sym]
    end

    def set_singular(rvalue)
      instance_variable_set("@#{controller_name.singularize}", rvalue)
    end

    def get_singular
      instance_variable_get("@#{controller_name.singularize}")
    end

end
