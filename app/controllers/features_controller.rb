class FeaturesController < ApplicationController
  skip_before_filter :authorize, :only => [:create, :update, :delete]

  # GET /features
  # GET /features.xml
  def index
    @features = Feature.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @features }
    end
  end

  # GET /features/1
  # GET /features/1.xml
  def show
    @feature = Feature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @feature }
    end
  end

  # GET /features/new
  # GET /features/new.xml
  def new
    @feature = Feature.new
    if session[:component_id]
      @feature[:component_id] = session[:component_id]
    end
#    @feature[:owner_id] = session[:user_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @feature }
    end
  end

  # GET /features/1/edit
  def edit
    @feature = Feature.find(params[:id])
  end

  # POST /features
  # POST /features.xml
  def create
    @feature = Feature.new(params[:feature])

    respond_to do |format|
      if @feature.save
        if ! params[:user_ids]
          params[:user_ids] = Array.new
        end
        if ! params[:user_ids].include? params[:feature][:owner_id]
          params[:user_ids] << params[:feature][:owner_id]
        end
        params[:user_ids].each do |ui|
          xref = UserFeatureXref.new
          xref.feature_id = @feature.id
          xref.user_id = ui
          xref.save
        end
        format.html { redirect_to(@feature, :notice => 'Feature was successfully created.') }
        format.xml  { render :xml => @feature, :status => :created, :location => @feature }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @feature.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /features/1
  # PUT /features/1.xml
  def update
    @feature = Feature.find(params[:id])

    xref = UserFeatureXref.delete_all("feature_id="+@feature.id.to_s)
    if ! params[:user_ids]
      params[:user_ids] = Array.new
    end
    if ! params[:user_ids].include? params[:feature][:owner_id]
      params[:user_ids] << params[:feature][:owner_id]
    end
    params[:user_ids].each do |ui|
      xref = UserFeatureXref.new
      xref.feature_id = @feature.id
      xref.user_id = ui
      xref.save
    end
    respond_to do |format|
      if @feature.update_attributes(params[:feature])
        format.html { redirect_to(@feature, :notice => 'Feature was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @feature.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /features/1
  # DELETE /features/1.xml
  def destroy
    @feature = Feature.find(params[:id])
    @feature.testcases.each do |tc|
      tc.destroy
    end
    UserFeatureXref.where(:feature_id=>params[:id]).each do |xref|
      xref.destroy
    end
    @feature.destroy

    respond_to do |format|
      format.html { redirect_to(features_url) }
      format.xml  { head :ok }
    end
  end
end
