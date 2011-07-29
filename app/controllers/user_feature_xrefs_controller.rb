class UserFeatureXrefsController < ApplicationController
  # GET /user_feature_xrefs
  # GET /user_feature_xrefs.xml
  def index
    @user_feature_xrefs = UserFeatureXref.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_feature_xrefs }
    end
  end

  # GET /user_feature_xrefs/1
  # GET /user_feature_xrefs/1.xml
  def show
    @user_feature_xref = UserFeatureXref.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_feature_xref }
    end
  end

  # GET /user_feature_xrefs/new
  # GET /user_feature_xrefs/new.xml
  def new
    @user_feature_xref = UserFeatureXref.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_feature_xref }
    end
  end

  # GET /user_feature_xrefs/1/edit
  def edit
    @user_feature_xref = UserFeatureXref.find(params[:id])
  end

  # POST /user_feature_xrefs
  # POST /user_feature_xrefs.xml
  def create
    @user_feature_xref = UserFeatureXref.new(params[:user_feature_xref])

    respond_to do |format|
      if @user_feature_xref.save
        format.html { redirect_to(@user_feature_xref, :notice => 'User feature xref was successfully created.') }
        format.xml  { render :xml => @user_feature_xref, :status => :created, :location => @user_feature_xref }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_feature_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_feature_xrefs/1
  # PUT /user_feature_xrefs/1.xml
  def update
    @user_feature_xref = UserFeatureXref.find(params[:id])

    respond_to do |format|
      if @user_feature_xref.update_attributes(params[:user_feature_xref])
        format.html { redirect_to(@user_feature_xref, :notice => 'User feature xref was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_feature_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_feature_xrefs/1
  # DELETE /user_feature_xrefs/1.xml
  def destroy
    @user_feature_xref = UserFeatureXref.find(params[:id])
    @user_feature_xref.destroy

    respond_to do |format|
      format.html { redirect_to(user_feature_xrefs_url) }
      format.xml  { head :ok }
    end
  end
end
