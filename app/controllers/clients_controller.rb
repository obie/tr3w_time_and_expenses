class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.xml
  def index
    @clients = Client.where(params.except(:action, :controller, :format))

    respond_to do |format|
      format.html # index.rhtml
      format.xml { render :xml => @clients.to_xml }
    end
  end

  def recent
    @clients = Client.recent

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @clients.to_xml }
    end
  end

  def newest
    @client = Client.recent.first

    respond_to do |format|
      format.html
      format.xml { render :xml => @client }
    end
  end
  
  # GET /clients/1
  # GET /clients/1.xml
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @client.to_xml }
    end
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1;edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.xml
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        flash[:notice] = 'Client was successfully created.'
        format.html { redirect_to client_path(@client) }
        format.xml  { head :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @client.errors.to_xml, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        flash[:notice] = 'Client was successfully updated.'
        format.html { redirect_to client_path(@client) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors.to_xml }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_path }
      format.xml  { head :ok }
    end
  end
end
