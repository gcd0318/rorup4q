class BugsController < ApplicationController
  # GET /bugs
  # GET /bugs.xml
  def index
    session[:condHash] = {}
    @bugs = Bug.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bugs }
    end
  end

  # GET /bugs/1
  # GET /bugs/1.xml
  def show
    @bug = Bug.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bug }
    end
  end

  # GET /bugs/new
  # GET /bugs/new.xml
  def new
    @bug = Bug.new
    if session[:feature_id]
      @bug.feature_id = session[:feature_id]
    end
    @attachment = Attachment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bug }
    end
  end

  # GET /bugs/1/edit
  def edit
    @bug = Bug.find(params[:id])
  end

  # POST /bugs
  # POST /bugs.xml
  def create
    if params[:commit] == 'Upload'
      @attachment = attach_file params
    else
      params[:bug][:attachment] = nil
      params[:bug].delete('attachment')
    end
    @bug = Bug.new(params[:bug])
    if params[:feature_id]
      @bug.feature_id = params[:feature_id]
    end
    if params[:assign_to_id]
      @bug.assign_to_id = params[:assign_to_id]
    end
    
    @bug.history = Time.now.to_s + ':' + @bug.feature.component.track.name+':OPEN'

    respond_to do |format|
      if @attachment
        if @attachment.save
          format.html { redirect_to edit_bug_path }
          format.xml
        end
      elsif @bug.save
        format.html { redirect_to(@bug, :notice => 'Bug was successfully created.') }
        format.xml  { render :xml => @bug, :status => :created, :location => @bug }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bug.errors, :status => :unprocessable_entity }
      end

      if params[:to_bug_id]!=''
        bx = BugXref.new
        bx.to_bug_id = params[:to_bug_id]
        bx.from_bug_id = @bug.id
        bx.save
      end

      if session[:testcase_id]
        xref = TestcaseBugXref.new
        xref.testcase_id = params[:testcase_id]
        xref.bug_id = @bug.id
        xref.save
        session[:testcase_id] = nil
      end
    end
  end

  # PUT /bugs/1
  # PUT /bugs/1.xml
  def update
    @bug = Bug.find(params[:id])
    if params[:feature_id]
      @bug.feature_id = params[:feature_id]
    end
    if params[:assign_to_id]
      @bug.assign_to_id = params[:assign_to_id]
    end
    
    if params[:comment].size > 0
      comment = params[:comment]
      @bug.body = @bug.body + "\n" + User.find_by_id(session[:user_id]).username + ' at ' + Time.now.to_s + ":\n" + comment + "\n"
    end

    if params[:commit] == 'Upload'
      @attachment = attach_file params
    else
      params[:bug][:attachment] = nil
      params[:bug].delete('attachment')
    end
    
    if params[:to_bug_id]!=''
      bx = BugXref.new
      bx.to_bug_id = params[:to_bug_id]
      bx.from_bug_id = @bug.id
      bx.save
    end

    if params[:bug][:status] != @bug.history.split(':')[-1]
      @bug.history = @bug.history + "\n" + Time.now.to_s + ':' + @bug.feature.component.track.name+':' + params[:bug][:status]
    end

    respond_to do |format|
      if @attachment
        if @attachment.save
          format.html { redirect_to edit_bug_path }
          format.xml
        end
      elsif @bug.update_attributes(params[:bug])
        format.html { redirect_to(@bug, :notice => 'Bug was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bug.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bugs/1
  # DELETE /bugs/1.xml
  def destroy
    @bug = Bug.find(params[:id])
    TestcaseBugXref.delete_all("bug_id="+params[:id])
    filename = "#{RAILS_ROOT}/public/files/"+File.join('attachments', 'bugs', @bug.id.to_s)
    FileUtils.rm_rf filename
    @bug.attachments.each do |a|
      a.destroy
    end
    @bug.destroy

    respond_to do |format|
      format.html { redirect_to(bugs_url) }
      format.xml  { head :ok }
    end
  end


  def attach_file params
    bug = Bug.find(params[:id])
    attachment = Attachment.new(params[:bug][:attachment])
    attachment.bug_id = params[:id]
    
    filename = "#{RAILS_ROOT}/public/files/"+File.join('attachments', 'bugs', bug.id.to_s, Time.now.to_i.to_s, attachment.name)
    sep = filename[filename.index(File.basename(filename))-1]
    path = File.dirname(filename)
    attachment.filepath = path+sep
    
    if !Dir.exists? path
      fn = ''
      path.split(sep).each do |f|
        fn = fn + sep + f
        if !Dir.exists? fn
          Dir.mkdir fn
        end
      end
    end

    File.open(filename, "wb") do |f| 
      f.write(params[:bug][:attachment][:attach_file].read)
    end
    return attachment
  end


  def get_attach
    attachment = Attachment.find_by_id(params[:attach_id])
    fullpath = attachment.filepath + attachment.name
    send_file fullpath
  end
  
  def remove_attach
    attachment = Attachment.find_by_id(params[:attach_id])
    bug = attachment.bug
    fullname = attachment.filepath + attachment.name
    File.delete fullname
    if Dir.glob(attachment.filepath+'*').size == 0
      Dir.rmdir attachment.filepath
      basepath = "#{RAILS_ROOT}/public/files/"+File.join('attachments', 'bugs', bug.id.to_s)
      p Dir.glob(basepath+'/*')
      if Dir.glob(basepath+'/*').size == 0
        Dir.rmdir basepath
      end
    end
    attachment.destroy
    respond_to do |format|
      format.html { redirect_to(edit_bug_path(bug), :notice => 'Attachment was removed.') }
      format.xml
    end
  end

  def filter
    @condHash = {}#session[:condHash]
    params.keys.each do |k|
      if k != 'action' && k != 'controller'
        @condHash[k] = params[k]
      end
    @bugs = Bug.where(@condHash)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bugs }
    end
  end

  def change_feature
    @bug = Bug.find_by_id(params[:bug_id])
    if ! @bug
      @bug = Bug.new
    end
    @bug.feature = nil
    render :action => "edit"
  end

  def get_sub_items
    if params[:product_id]
      @tracks = Track.where(:product_id=>params[:product_id])
      render :partial => "select_track"
    elsif params[:track_id]
      @components = Component.where(:track_id=>params[:track_id])
      render :partial => "select_component"
    elsif params[:component_id]
      @features = Feature.where(:component_id=>params[:component_id])
      render :partial => "select_feature"
    elsif params[:feature_id]
      @assign_to = Feature.find_by_id(params[:feature_id]).owner
      render :partial => "select_assign_to"
    end
  end  

  def remove_link
    @bug = Bug.find(params[:id])
    BugXref.delete_all("from_bug_id="+@bug.id.to_s+" && to_bug_id="+params[:linked_id])
    BugXref.delete_all("to_bug_id="+@bug.id.to_s+" && from_bug_id="+params[:linked_id])
    respond_to do |format|
      format.html { redirect_to(edit_bug_path(@bug), :notice => 'Attachment was removed.') }
      format.xml
    end
  end

  def no_relate
    @bug = Bug.find(params[:bug_id])
    TestcaseBugXref.delete_all("testcase_id="+params[:testcase_id]+" && bug_id="+params[:bug_id])
    respond_to do |format|
      format.html { redirect_to(@bug, :notice => 'Bug was removed from this testcase.') }
      format.xml  { head :ok }
    end
  end

  def link_to_testcase
    @bug = Bug.find(params[:id])
    @xref = TestcaseBugXref.new
    @xref[:bug_id] = params[:id]
    if params[:testcase_id].size > 0
      @xref[:testcase_id] = params[:testcase_id]
      @xref.save
      msg = ', and testcase is linked.'
      respond_to do |format|
        format.html { redirect_to(@bug, :notice => 'Bug is added.') }
        format.xml  { head :ok }
      end  
    end
  end

  def show_commits
    @bug = Bug.find_by_id(params[:bug_id])
    @commits = @bug.feature.component.track.main_repo.get_s_commits(@bug, @bug.id.to_s)
    render :action => 'show'
  end
  def hide_commits
    @bug = Bug.find_by_id(params[:bug_id])
    @commits = nil
    render :action => 'show'
  end


  def fix
    @bug = Bug.find_by_id(params[:bug_id])
    @repo = @bug.feature.component.track.main_repo
    render :action => 'fix'
  end

end
