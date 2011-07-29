class TestcaseBugXrefsController < ApplicationController
  # GET /testcase_bug_xrefs
  # GET /testcase_bug_xrefs.xml
  def index
    @testcase_bug_xrefs = TestcaseBugXref.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @testcase_bug_xrefs }
    end
  end

  # GET /testcase_bug_xrefs/1
  # GET /testcase_bug_xrefs/1.xml
  def show
    @testcase_bug_xref = TestcaseBugXref.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @testcase_bug_xref }
    end
  end

  # GET /testcase_bug_xrefs/new
  # GET /testcase_bug_xrefs/new.xml
  def new
    @testcase_bug_xref = TestcaseBugXref.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @testcase_bug_xref }
    end
  end

  # GET /testcase_bug_xrefs/1/edit
  def edit
    @testcase_bug_xref = TestcaseBugXref.find(params[:id])
  end

  # POST /testcase_bug_xrefs
  # POST /testcase_bug_xrefs.xml
  def create
    @testcase_bug_xref = TestcaseBugXref.new(params[:testcase_bug_xref])

    respond_to do |format|
      if @testcase_bug_xref.save
        format.html { redirect_to(@testcase_bug_xref, :notice => 'Testcase bug xref was successfully created.') }
        format.xml  { render :xml => @testcase_bug_xref, :status => :created, :location => @testcase_bug_xref }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @testcase_bug_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /testcase_bug_xrefs/1
  # PUT /testcase_bug_xrefs/1.xml
  def update
    @testcase_bug_xref = TestcaseBugXref.find(params[:id])

    respond_to do |format|
      if @testcase_bug_xref.update_attributes(params[:testcase_bug_xref])
        format.html { redirect_to(@testcase_bug_xref, :notice => 'Testcase bug xref was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @testcase_bug_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /testcase_bug_xrefs/1
  # DELETE /testcase_bug_xrefs/1.xml
  def destroy
    @testcase_bug_xref = TestcaseBugXref.find(params[:id])
    @testcase_bug_xref.destroy

    respond_to do |format|
      format.html { redirect_to(testcase_bug_xrefs_url) }
      format.xml  { head :ok }
    end
  end
end
