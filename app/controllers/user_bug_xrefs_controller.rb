class UserBugXrefsController < ApplicationController
  # GET /user_bug_xrefs
  # GET /user_bug_xrefs.xml
  def index
    @user_bug_xrefs = UserBugXref.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_bug_xrefs }
    end
  end

  # GET /user_bug_xrefs/1
  # GET /user_bug_xrefs/1.xml
  def show
    @user_bug_xref = UserBugXref.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_bug_xref }
    end
  end

  # GET /user_bug_xrefs/new
  # GET /user_bug_xrefs/new.xml
  def new
    @user_bug_xref = UserBugXref.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_bug_xref }
    end
  end

  # GET /user_bug_xrefs/1/edit
  def edit
    @user_bug_xref = UserBugXref.find(params[:id])
  end

  # POST /user_bug_xrefs
  # POST /user_bug_xrefs.xml
  def create
    @user_bug_xref = UserBugXref.new(params[:user_bug_xref])

    respond_to do |format|
      if @user_bug_xref.save
        format.html { redirect_to(@user_bug_xref, :notice => 'User bug xref was successfully created.') }
        format.xml  { render :xml => @user_bug_xref, :status => :created, :location => @user_bug_xref }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_bug_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_bug_xrefs/1
  # PUT /user_bug_xrefs/1.xml
  def update
    @user_bug_xref = UserBugXref.find(params[:id])

    respond_to do |format|
      if @user_bug_xref.update_attributes(params[:user_bug_xref])
        format.html { redirect_to(@user_bug_xref, :notice => 'User bug xref was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_bug_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_bug_xrefs/1
  # DELETE /user_bug_xrefs/1.xml
  def destroy
    @user_bug_xref = UserBugXref.find(params[:id])
    @user_bug_xref.destroy

    respond_to do |format|
      format.html { redirect_to(user_bug_xrefs_url) }
      format.xml  { head :ok }
    end
  end
end
