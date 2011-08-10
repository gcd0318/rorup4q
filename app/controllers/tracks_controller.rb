class TracksController < ApplicationController
  skip_before_filter :authorize, :only => [:create, :update, :delete]

  # GET /tracks
  # GET /tracks.xml
  def index
    @tracks = Track.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tracks }
    end
  end

  # GET /tracks/1
  # GET /tracks/1.xml
  def show
    @track = Track.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @track }
    end
  end

  # GET /tracks/new
  # GET /tracks/new.xml
  def new
    @track = Track.new
    
    if session[:product_id]
      @track[:product_id] = session[:product_id]
    end
#    @track[:owner_id] = session[:user_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @track }
    end
  end

  # GET /tracks/1/edit
  def edit
    @track = Track.find(params[:id])
  end

  # POST /tracks
  # POST /tracks.xml
  def create
    @track = Track.new(params[:track])

    respond_to do |format|
      if @track.save
        if ! params[:user_ids]
          params[:user_ids] = Array.new
        end
        if ! params[:user_ids].include? params[:track][:owner_id]
          params[:user_ids] << params[:track][:owner_id]
        end
        params[:user_ids].each do |ui|
          xref = UserTrackXref.new
          xref.track_id = @track.id
          xref.user_id = ui
          xref.save
        end
        format.html { redirect_to(@track, :notice => 'Track was successfully created.') }
        format.xml  { render :xml => @track, :status => :created, :location => @track }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @track.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tracks/1
  # PUT /tracks/1.xml
  def update
    @track = Track.find(params[:id])

    xref = UserTrackXref.delete_all("track_id="+@track.id.to_s)
    if ! params[:user_ids]
      params[:user_ids] = Array.new
    end
    if ! params[:user_ids].include? params[:track][:owner_id]
      params[:user_ids] << params[:track][:owner_id]
    end
    params[:user_ids].each do |ui|
      xref = UserTrackXref.new
      xref.track_id = @track.id
      xref.user_id = ui
      xref.save
    end

    respond_to do |format|
      if @track.update_attributes(params[:track])
        format.html { redirect_to(@track, :notice => 'Track was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @track.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.xml
  def destroy
    @track = Track.find(params[:id])
    @track.components.each do |comp|
      comp.destroy
    end
    UserTrackXref.where(:track_id=>params[:id]).each do |xref|
      xref.destroy
    end
    @track.destroy

    respond_to do |format|
      format.html { redirect_to(tracks_url) }
      format.xml  { head :ok }
    end
  end
  
  def delete_repository
    @track = Track.find_by_id(params[:track_id])
    if @track.main_repo_id = params[:repository_id]
      @track.main_repo_id = nil
    end
    Repository.find_by_id(params[:repository_id]).destroy
    respond_to do |format|
      format.html { redirect_to(@track, :notice => 'Repository is removed.') }
      format.xml  { head :ok }
    end
  end
end
