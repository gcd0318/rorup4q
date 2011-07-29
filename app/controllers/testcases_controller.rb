class TestcasesController < ApplicationController
  skip_before_filter :authorize, :only => [:create, :update, :delete]

  # GET /testcases
  # GET /testcases.xml
  def index
    session[:condHash] = {}
    @testcases = Testcase.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @testcases }
    end
  end

  # GET /testcases/1
  # GET /testcases/1.xml
  def show
    @testcase = Testcase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @testcase }
    end
  end

  # GET /testcases/new
  # GET /testcases/new.xml
  def new
    @testcase = Testcase.new
    if session[:feature_id]
      @testcase[:feature_id] = session[:feature_id]
    end
    @testcase[:owner_id] = session[:user_id]
    @testcase[:assign_to_testcase_id] = session[:user_id]
    @testcase[:status] = 'DONE'

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @testcase }
    end
  end

  # GET /testcases/1/edit
  def edit
    @testcase = Testcase.find(params[:id])
  end

  # POST /testcases
  # POST /testcases.xml
  def create
    @testcase = Testcase.new(params[:testcase])
    respond_to do |format|
      if @testcase.save
        format.html { redirect_to(@testcase, :notice => 'Testcase was successfully created.') }
        format.xml  { render :xml => @testcase, :status => :created, :location => @testcase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @testcase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /testcases/1
  # PUT /testcases/1.xml
  def update
    @testcase = Testcase.find(params[:id])
    @testcase[:status] = 'UNDO'
    respond_to do |format|
      if @testcase.update_attributes(params[:testcase])
        format.html { redirect_to(@testcase, :notice => 'Testcase was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @testcase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /testcases/1
  # DELETE /testcases/1.xml
  def destroy
    @testcase = Testcase.find(params[:id])
    TestcaseXref.delete_all("from_testcase_id="+params[:id]+" || to_testcase_id="+params[:id])
    UserTestcaseXref.delete_all("testcase_id="+params[:id])
    TestcaseBugXref.delete_all("testcase_id="+params[:id])
    @testcase.destroy

    respond_to do |format|
      format.html { redirect_to(testcases_url) }
      format.xml  { head :ok }
    end
  end

  def add_link
    @testcase = Testcase.find(params[:from_testcase_id])
    xref = TestcaseXref.new(:from_testcase_id=>params[:from_testcase_id], :to_testcase_id=>params[:to_testcase_id])
    if xref.save
      respond_to do |format|
        format.html { redirect_to(@testcase, :notice => 'Testcase was successfully linked.') }
        format.xml  { head :ok }
      end
    end
  end
  
  def remove_link
    @testcase = Testcase.find(params[:from_testcase_id])
    TestcaseXref.delete_all("from_testcase_id="+params[:from_testcase_id]+" && to_testcase_id="+params[:to_testcase_id])
    respond_to do |format|
      format.html { redirect_to(@testcase, :notice => 'Link was successfully removed.') }
      format.xml  { head :ok }
    end
  end

  def save_status
    @testcase = Testcase.find(params[:id])
    @testcase[:status] = params[:status]
    msg = ''
    if @testcase.save
      respond_to do |format|
        format.html { redirect_to(@testcase, :notice => 'Status was successfully updated'+msg) }
        format.xml  { head :ok }
      end
    else
      respond_to do |format|
        format.html { redirect_to(@testcase, :notice => 'Status is not saved.') }
        format.xml  { head :ok }
      end  
    end
  end

  def link_to_bug
    @testcase = Testcase.find(params[:id])
    @xref = TestcaseBugXref.new
    @xref[:testcase_id] = params[:id]
    if params[:bug_id].size > 0
      @xref[:bug_id] = params[:bug_id]
      @xref.save
      msg = ', and bug is linked.'
      respond_to do |format|
        format.html { redirect_to(@testcase, :notice => 'Bug is added.') }
        format.xml  { head :ok }
      end  
    end
  end

  def no_relate
    @testcase = Testcase.find(params[:testcase_id])
    TestcaseBugXref.delete_all("testcase_id="+params[:testcase_id]+" && bug_id="+params[:bug_id])
    respond_to do |format|
      format.html { redirect_to(@testcase, :notice => 'Bug was removed from this testcase.') }
      format.xml  { head :ok }
    end
  end


  def bug_links
    @testcase = Testcase.find(params[:id])
    @selected_status = params[:status]
    render :partial => "bug_link"
  end


  def filter
    @condHash = {}#session[:condHash]
    params.keys.each do |k|
      if k != 'action' && k != 'controller'
        @condHash[k] = params[k]
      end
    @testcases = Testcase.where(@condHash)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @testcases }
    end
  end

end
