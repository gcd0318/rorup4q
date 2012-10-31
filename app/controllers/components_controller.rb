class ComponentsController < ApplicationController
  skip_before_filter :authorize, :only => [:create, :update, :delete]

  # GET /components
  # GET /components.xml
  def index
    @components = Component.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components }
    end
  end

  # GET /components/1
  # GET /components/1.xml
  def show
    @component = Component.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @component }
    end
  end

  # GET /components/new
  # GET /components/new.xml
  def new
    @component = Component.new


    if session[:track_id]
      @component[:track_id] = session[:track_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @component }
    end
  end

  # GET /components/1/edit
  def edit
    @component = Component.find(params[:id])
  end

  # POST /components
  # POST /components.xml
  def create
    @component = Component.new(params[:component])

    respond_to do |format|
      if @component.save
        if ! params[:user_ids]
          params[:user_ids] = Array.new
        end
        if ! params[:user_ids].include? params[:component][:owner_id]
          params[:user_ids] << params[:component][:owner_id]
        end
        params[:user_ids].each do |ui|
          xref = UserComponentXref.new
          xref.component_id = @component.id
          xref.user_id = ui
          xref.save
        end
        format.html { redirect_to(@component, :notice => 'Component was successfully created.') }
        format.xml  { render :xml => @component, :status => :created, :location => @component }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/1
  # PUT /components/1.xml
  def update
    @component = Component.find(params[:id])

    xref = UserComponentXref.delete_all("component_id="+@component.id.to_s)
    if ! params[:user_ids]
      params[:user_ids] = Array.new
    end
    if ! params[:user_ids].include? params[:component][:owner_id]
      params[:user_ids] << params[:component][:owner_id]
    end
    params[:user_ids].each do |ui|
      xref = UserComponentXref.new
      xref.component_id = @component.id
      xref.user_id = ui
      xref.save
    end

    respond_to do |format|
      if @component.update_attributes(params[:component])
        format.html { redirect_to(@component, :notice => 'Component was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/1
  # DELETE /components/1.xml
  def destroy
    @component = Component.find(params[:id])
    @component.features.each do |f|
      f.destroy
    end
    UserComponentXref.where(:component_id=>params[:id]).each do |xref|
      xref.destroy
    end
    @component.destroy

    respond_to do |format|
      format.html { redirect_to(components_url) }
      format.xml  { head :ok }
    end
  end
end
