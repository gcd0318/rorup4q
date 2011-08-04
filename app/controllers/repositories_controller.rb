class RepositoriesController < ApplicationController
  # GET /repositories
  # GET /repositories.xml
  def index
    @repositories = Repository.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @repositories }
    end
  end

  # GET /repositories/1
  # GET /repositories/1.xml
  def show
    @repository = Repository.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @repository }
    end
  end

  # GET /repositories/new
  # GET /repositories/new.xml
  def new
    @repository = Repository.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @repository }
    end
  end

  # GET /repositories/1/edit
  def edit
    @repository = Repository.find(params[:id])
  end

  # POST /repositories
  # POST /repositories.xml
  def create
    @repository = Repository.new(params[:repository])

    respond_to do |format|
      if @repository.save

        is_main = params[:is_main]
        if is_main
          track = @repository.track
          track.main_repo_id = params[:id]
          track.save
        end
      
        format.html { redirect_to(@repository, :notice => 'Repository was successfully created.') }
        format.xml  { render :xml => @repository, :status => :created, :location => @repository }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @repository.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /repositories/1
  # PUT /repositories/1.xml
  def update
    @repository = Repository.find(params[:id])
    is_main = params[:is_main]
    if is_main
      track = @repository.track
      track.main_repo_id = params[:id]
      track.save
    end

    respond_to do |format|
      if @repository.update_attributes(params[:repository])
        format.html { redirect_to(@repository, :notice => 'Repository was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @repository.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /repositories/1
  # DELETE /repositories/1.xml
  def destroy
    @repository = Repository.find(params[:id])
    @repository.destroy

    respond_to do |format|
      format.html { redirect_to(repositories_url) }
      format.xml  { head :ok }
    end
  end

  def show_detail
    @repository = Repository.find(params[:id])
    @commits = @repository.get_commits
    render :action => 'show'
  end
  def hide_detail
    @repository = Repository.find(params[:id])
    @commits = nil
    render :action => 'show'
  end
  






  def show_commit
    @bug = Bug.find_by_id(params[:bug_id])
    repo = @bug.feature.component.track.main_repo
    @commit = repo.get_commit_by_id(params[:commit])
    @earlier_commits = repo.earlier_commits(@commit)
    render :partial => 'show_commit'
  end


  def diff_commits
    repo = Bug.find_by_id(params[:bug_id]).feature.component.track.main_repo
    c1 = repo.get_commit_by_id(params[:commit])
    if params[:earlier_commit]
      c2 = repo.get_commit_by_id(params[:earlier_commit])
      @diff = repo.diff_commits(c1, c2)
      render :partial => "show_commit"
    end
  end


end
