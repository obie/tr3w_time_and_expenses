class ClientsController < ApplicationController
  respond_to :html, :xml
  # GET /clients
  # GET /clients.xml
  def index
    @clients = Client.where(params.except(:action, :controller, :format))
    respond_with(@clients)
  end

  def recent
    @clients = Client.recent
    respond_with(@clients)
  end

  def newest
    @client = Client.recent.first
    respond_with(@client)
  end

  # GET /clients/1
  # GET /clients/1.xml
  def show
    @client = Client.find(params[:id])
    respond_with(@client)
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
    flash[:notice] = 'Client was successfully created.' if @client.save
    respond_with(@client)
  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    @client = Client.find(params[:id])
    flash[:notice] = 'Client was successfully updated.' if @client.update_attributes(params[:client])
    respond_with(@client)
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    respond_with(@client)
  end
end
