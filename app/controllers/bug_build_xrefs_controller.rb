class BugBuildXrefsController < ApplicationController
  # GET /bug_build_xrefs
  # GET /bug_build_xrefs.xml
  def index
    @bug_build_xrefs = BugBuildXref.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bug_build_xrefs }
    end
  end

  # GET /bug_build_xrefs/1
  # GET /bug_build_xrefs/1.xml
  def show
    @bug_build_xref = BugBuildXref.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bug_build_xref }
    end
  end

  # GET /bug_build_xrefs/new
  # GET /bug_build_xrefs/new.xml
  def new
    @bug_build_xref = BugBuildXref.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bug_build_xref }
    end
  end

  # GET /bug_build_xrefs/1/edit
  def edit
    @bug_build_xref = BugBuildXref.find(params[:id])
  end

  # POST /bug_build_xrefs
  # POST /bug_build_xrefs.xml
  def create
    @bug_build_xref = BugBuildXref.new(params[:bug_build_xref])

    respond_to do |format|
      if @bug_build_xref.save
        format.html { redirect_to(@bug_build_xref, :notice => 'Bug build xref was successfully created.') }
        format.xml  { render :xml => @bug_build_xref, :status => :created, :location => @bug_build_xref }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bug_build_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bug_build_xrefs/1
  # PUT /bug_build_xrefs/1.xml
  def update
    @bug_build_xref = BugBuildXref.find(params[:id])

    respond_to do |format|
      if @bug_build_xref.update_attributes(params[:bug_build_xref])
        format.html { redirect_to(@bug_build_xref, :notice => 'Bug build xref was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bug_build_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bug_build_xrefs/1
  # DELETE /bug_build_xrefs/1.xml
  def destroy
    @bug_build_xref = BugBuildXref.find(params[:id])
    @bug_build_xref.destroy

    respond_to do |format|
      format.html { redirect_to(bug_build_xrefs_url) }
      format.xml  { head :ok }
    end
  end
end
