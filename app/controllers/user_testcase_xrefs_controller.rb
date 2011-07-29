class UserTestcaseXrefsController < ApplicationController
  # GET /user_testcase_xrefs
  # GET /user_testcase_xrefs.xml
  def index
    @user_testcase_xrefs = UserTestcaseXref.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_testcase_xrefs }
    end
  end

  # GET /user_testcase_xrefs/1
  # GET /user_testcase_xrefs/1.xml
  def show
    @user_testcase_xref = UserTestcaseXref.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_testcase_xref }
    end
  end

  # GET /user_testcase_xrefs/new
  # GET /user_testcase_xrefs/new.xml
  def new
    @user_testcase_xref = UserTestcaseXref.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_testcase_xref }
    end
  end

  # GET /user_testcase_xrefs/1/edit
  def edit
    @user_testcase_xref = UserTestcaseXref.find(params[:id])
  end

  # POST /user_testcase_xrefs
  # POST /user_testcase_xrefs.xml
  def create
    @user_testcase_xref = UserTestcaseXref.new(params[:user_testcase_xref])

    respond_to do |format|
      if @user_testcase_xref.save
        format.html { redirect_to(@user_testcase_xref, :notice => 'User testcase xref was successfully created.') }
        format.xml  { render :xml => @user_testcase_xref, :status => :created, :location => @user_testcase_xref }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_testcase_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_testcase_xrefs/1
  # PUT /user_testcase_xrefs/1.xml
  def update
    @user_testcase_xref = UserTestcaseXref.find(params[:id])

    respond_to do |format|
      if @user_testcase_xref.update_attributes(params[:user_testcase_xref])
        format.html { redirect_to(@user_testcase_xref, :notice => 'User testcase xref was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_testcase_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_testcase_xrefs/1
  # DELETE /user_testcase_xrefs/1.xml
  def destroy
    @user_testcase_xref = UserTestcaseXref.find(params[:id])
    @user_testcase_xref.destroy

    respond_to do |format|
      format.html { redirect_to(user_testcase_xrefs_url) }
      format.xml  { head :ok }
    end
  end
end
