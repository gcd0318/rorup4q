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
    @bug = Bug.find_by_id(params[:bug_id])
    @repo = @bug.feature.component.track.main_repo
    @clicked_path = params[:sf]
    @subs = Array.new
    if @clicked_path != @repo.filepath
      @subs << '..'
    end
    if ! @clicked_path.end_with? '/'
      @clicked_path = @clicked_path + '/'
    end
    sub_folders = Array.new
    sub_files = Array.new
    Dir.glob(@clicked_path+'*').each do |sf|
      if File.directory? sf
        sub_folders << sf + '/'
      elsif File.file? sf
        sub_files << sf
      end
    end
    @subs = @subs + sub_folders + sub_files
    render :partial=>'bugs/fix'
  end
  def select_a_file
    @bug = Bug.find_by_id(params[:bug_id])
    @repo = @bug.feature.component.track.main_repo
    @clicked_file = params[:sf]
    render :partial=>'bugs/fix'
  end

  def re_select
    @bug = Bug.find_by_id(params[:bug_id])
    @repo = @bug.feature.component.track.main_repo
    @clicked_file =nil
    render :partial=>'bugs/fix'
  end

end
