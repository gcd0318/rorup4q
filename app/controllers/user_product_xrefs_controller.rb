class UserProductXrefsController < ApplicationController
  # GET /user_product_xrefs
  # GET /user_product_xrefs.xml
  def index
    @user_product_xrefs = UserProductXref.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_product_xrefs }
    end
  end

  # GET /user_product_xrefs/1
  # GET /user_product_xrefs/1.xml
  def show
    @user_product_xref = UserProductXref.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_product_xref }
    end
  end

  # GET /user_product_xrefs/new
  # GET /user_product_xrefs/new.xml
  def new
    @user_product_xref = UserProductXref.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_product_xref }
    end
  end

  # GET /user_product_xrefs/1/edit
  def edit
    @user_product_xref = UserProductXref.find(params[:id])
  end

  # POST /user_product_xrefs
  # POST /user_product_xrefs.xml
  def create
    @user_product_xref = UserProductXref.new(params[:user_product_xref])

    respond_to do |format|
      if @user_product_xref.save
        format.html { redirect_to(@user_product_xref, :notice => 'User product xref was successfully created.') }
        format.xml  { render :xml => @user_product_xref, :status => :created, :location => @user_product_xref }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_product_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_product_xrefs/1
  # PUT /user_product_xrefs/1.xml
  def update
    @user_product_xref = UserProductXref.find(params[:id])

    respond_to do |format|
      if @user_product_xref.update_attributes(params[:user_product_xref])
        format.html { redirect_to(@user_product_xref, :notice => 'User product xref was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_product_xref.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_product_xrefs/1
  # DELETE /user_product_xrefs/1.xml
  def destroy
    @user_product_xref = UserProductXref.find(params[:id])
    @user_product_xref.destroy

    respond_to do |format|
      format.html { redirect_to(user_product_xrefs_url) }
      format.xml  { head :ok }
    end
  end
end
