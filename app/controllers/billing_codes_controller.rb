class BillingCodesController < BelongsToCrudController
  parent_model :Client

  def index
    @billing_codes = BillingCode.where(:client_id => params[:client_id])

    respond_to do |format|
      format.html
      format.xml { render :xml => @billing_codes }
    end
  end

end
