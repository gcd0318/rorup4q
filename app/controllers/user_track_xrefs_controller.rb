class UserTrackXrefsController < ApplicationController
  skip_before_filter :authorize, :only => [:create, :update, :delete]

  # GET /user_track_xrefs
  # GET /user_track_xrefs.xml
  def index
    @user_track_xrefs = UserTrackXref.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_track_xrefs }
    end
  end

  # GET /user_track_xrefs/1
  # GET /user_track_xrefs/1.xml
  def show
    @user_track_xref = UserTrackXref.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_track_xref }
    end
  end

  # GET /user_track_xrefs/new
  # GET /user_track_xrefs/new.xml
  def new
    @user_track_xref = UserTrackXref.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_track_xref }
    end
  end

  # GET /user_track_xrefs/1/edit
  def edit
    @user_track_xref = UserTrackXref.find(params[:id])
  end

  # POST /user_track_xrefs
  # POST /user_track_xrefs.xml
  def create
    @user_track_xref = UserTrackXref.new(params[:user_track_xref])

    respond_to do |format|
      if @user_track_xref.save
        format.html { redirect_to(@user_track_xref, :notice => 'User track xref was successfully created.') }
        format.xml  { render :xml => @user_track_xref, :status => :created, :location => @user_track_xref }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_track_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_track_xrefs/1
  # PUT /user_track_xrefs/1.xml
  def update
    @user_track_xref = UserTrackXref.find(params[:id])

    respond_to do |format|
      if @user_track_xref.update_attributes(params[:user_track_xref])
        format.html { redirect_to(@user_track_xref, :notice => 'User track xref was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_track_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_track_xrefs/1
  # DELETE /user_track_xrefs/1.xml
  def destroy
    @user_track_xref = UserTrackXref.find(params[:id])
    @user_track_xref.destroy

    respond_to do |format|
      format.html { redirect_to(user_track_xrefs_url) }
      format.xml  { head :ok }
    end
  end
end
