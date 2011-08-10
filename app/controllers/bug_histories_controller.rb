class BugHistoriesController < ApplicationController
  # GET /bug_histories
  # GET /bug_histories.xml
  def index
    @bug_histories = BugHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bug_histories }
    end
  end

  # GET /bug_histories/1
  # GET /bug_histories/1.xml
  def show
    @bug_history = BugHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bug_history }
    end
  end

  # GET /bug_histories/new
  # GET /bug_histories/new.xml
  def new
    @bug_history = BugHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bug_history }
    end
  end

  # GET /bug_histories/1/edit
  def edit
    @bug_history = BugHistory.find(params[:id])
  end

  # POST /bug_histories
  # POST /bug_histories.xml
  def create
    @bug_history = BugHistory.new(params[:bug_history])

    respond_to do |format|
      if @bug_history.save
        format.html { redirect_to(@bug_history, :notice => 'Bug history was successfully created.') }
        format.xml  { render :xml => @bug_history, :status => :created, :location => @bug_history }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bug_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bug_histories/1
  # PUT /bug_histories/1.xml
  def update
    @bug_history = BugHistory.find(params[:id])

    respond_to do |format|
      if @bug_history.update_attributes(params[:bug_history])
        format.html { redirect_to(@bug_history, :notice => 'Bug history was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bug_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bug_histories/1
  # DELETE /bug_histories/1.xml
  def destroy
    @bug_history = BugHistory.find(params[:id])
    @bug_history.destroy

    respond_to do |format|
      format.html { redirect_to(bug_histories_url) }
      format.xml  { head :ok }
    end
  end
end
