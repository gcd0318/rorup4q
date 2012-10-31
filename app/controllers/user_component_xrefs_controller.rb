class UserComponentXrefsController < ApplicationController
  skip_before_filter :authorize, :only => [:create, :update, :delete]

  # GET /user_component_xrefs
  # GET /user_component_xrefs.xml
  def index
    @user_component_xrefs = UserComponentXref.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_component_xrefs }
    end
  end

  # GET /user_component_xrefs/1
  # GET /user_component_xrefs/1.xml
  def show
    @user_component_xref = UserComponentXref.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_component_xref }
    end
  end

  # GET /user_component_xrefs/new
  # GET /user_component_xrefs/new.xml
  def new
    @user_component_xref = UserComponentXref.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_component_xref }
    end
  end

  # GET /user_component_xrefs/1/edit
  def edit
    @user_component_xref = UserComponentXref.find(params[:id])
  end

  # POST /user_component_xrefs
  # POST /user_component_xrefs.xml
  def create
    @user_component_xref = UserComponentXref.new(params[:user_component_xref])

    respond_to do |format|
      if @user_component_xref.save
        format.html { redirect_to(@user_component_xref, :notice => 'User component xref was successfully created.') }
        format.xml  { render :xml => @user_component_xref, :status => :created, :location => @user_component_xref }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_component_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_component_xrefs/1
  # PUT /user_component_xrefs/1.xml
  def update
    @user_component_xref = UserComponentXref.find(params[:id])

    respond_to do |format|
      if @user_component_xref.update_attributes(params[:user_component_xref])
        format.html { redirect_to(@user_component_xref, :notice => 'User component xref was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_component_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_component_xrefs/1
  # DELETE /user_component_xrefs/1.xml
  def destroy
    @user_component_xref = UserComponentXref.find(params[:id])
    @user_component_xref.destroy

    respond_to do |format|
      format.html { redirect_to(user_component_xrefs_url) }
      format.xml  { head :ok }
    end
  end
end
