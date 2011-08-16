class FixingCodesController < ApplicationController
  # GET /fixing_codes
  # GET /fixing_codes.xml
  
  def index
    @fixing_codes = FixingCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fixing_codes }
    end
  end

  # GET /fixing_codes/1
  # GET /fixing_codes/1.xml
  def show
    @fixing_code = FixingCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fixing_code }
    end
  end

  # GET /fixing_codes/new
  # GET /fixing_codes/new.xml
  def new
    @fixing_code = FixingCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fixing_code }
    end
  end

  # GET /fixing_codes/1/edit
  def edit
    @fixing_code = FixingCode.find(params[:id])
  end

  # POST /fixing_codes
  # POST /fixing_codes.xml
  def create
    @fixing_code = FixingCode.new(params[:fixing_code])

    respond_to do |format|
      if @fixing_code.save
        format.html { redirect_to(@fixing_code, :notice => 'Fixing code was successfully created.') }
        format.xml  { render :xml => @fixing_code, :status => :created, :location => @fixing_code }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fixing_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fixing_codes/1
  # PUT /fixing_codes/1.xml
  def update
    @fixing_code = FixingCode.find(params[:id])

    respond_to do |format|
      if @fixing_code.update_attributes(params[:fixing_code])
        format.html { redirect_to(@fixing_code, :notice => 'Fixing code was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fixing_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fixing_codes/1
  # DELETE /fixing_codes/1.xml
  def destroy
    @fixing_code = FixingCode.find(params[:id])
    @fixing_code.destroy

    respond_to do |format|
      format.html { redirect_to(fixing_codes_url) }
      format.xml  { head :ok }
    end
  end


  def get_subs
    @filepath = params[:filepath]
    @parent_path = params[:parent_path]
    @bug = Bug.find_by_id(params[:bug_id])
    @repo = @bug.feature.component.track.main_repo
    @root_path = @repo.filepath
    @sub_folders = Array.new
    @sub_files = Array.new
    real_path = @root_path + params[:parent_path].to_s + @filepath
    if (@filepath != '') && !(@filepath =='..' && @parent_path.split('/').size==1)
      @sub_folders << '..'
    end
    if @filepath == '..'
      plist = @parent_path.split('/')
      plist.pop
      if plist.size > 0
        real_path = File.join(@root_path, plist)+'/'
      else
        real_path = @root_path
      end
    end
    @parent_path = real_path.gsub(@root_path,'')
    Dir.glob(real_path+'*').each do |sf|
      if File.directory? sf
        @sub_folders << sf.gsub(real_path,'') + '/'
      elsif File.file? sf
        @sub_files << sf.gsub(real_path,'')
      end
    end
    render :action=>'bugs/fix'
  end
  def select_a_file
    @bug = Bug.find_by_id(params[:bug_id])
    @repo = @bug.feature.component.track.main_repo
    @clicked_file = @repo.filepath + params[:filepath]
    render :action=>'bugs/fix'
  end
  def re_select
    @bug = Bug.find_by_id(params[:bug_id])
    @repo = @bug.feature.component.track.main_repo
    @clicked_file =nil
    render :action=>'bugs/fix'
  end

  def show_diffs
    @bug = Bug.find_by_id(params[:bug_id])
    @repo = @bug.feature.component.track.main_repo
    if params[:local_repo_path] != ''
      local_repo = Codemgr.new(params[:local_repo_path], @repo.mgr_type)
      remote_repo = Codemgr.new(@repo.filepath, @repo.mgr_type)
      p local_repo.mgr_type
      p remote_repo.mgr_type
      @diffs = Array.new
      remote_repo.commits_diffs(local_repo).each do |c|
        c.diffs.each do |d|
          @diffs << d
        end
      end
    else
      @diffs = nil
    end
      render :action=>'bugs/fix'
#    render :action=>'show_diffs'
  end

  def replace_file
  end


  def to_commit
    @remote_repo = Repository.find_by_id(params[:remote_repo_id])
    render :partial=>'commit_change'
  end

  def commit_files
  end

end
