class ProductsController < ApplicationController
  skip_before_filter :authorize, :only => [:create, :update, :delete]

  # GET /products
  # GET /products.xml
  def index
    session[:condHash] = {}
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new
#    @product[:owner_id] = session[:user_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        if ! params[:user_ids]
          params[:user_ids] = Array.new
        end
        if ! params[:user_ids].include? params[:product][:owner_id]
          params[:user_ids] << params[:product][:owner_id]
        end
        params[:user_ids].each do |ui|
          xref = UserProductXref.new
          xref.product_id = @product.id
          xref.user_id = ui
          xref.save
        end
        format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])
    xref = UserProductXref.delete_all("product_id="+@product.id.to_s)
    if ! params[:user_ids]
      params[:user_ids] = Array.new
    end
    if ! params[:user_ids].include? params[:product][:owner_id]
      params[:user_ids] << params[:product][:owner_id]
    end
    params[:user_ids].each do |ui|
      xref = UserProductXref.new
      xref.product_id = @product.id
      xref.user_id = ui
      xref.save
    end

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.tracks.each do |t|
      t.destroy
    end
    UserProductXref.where(:product_id=>params[:id]).each do |xref|
      xref.destroy
    end
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end

  def add_member
    xref = UserProductXref.new(:product_id => params[:id], :user_id => params[:member_id])
    if xref.save
      respond_to do |format|
        format.html { render :action => "edit" }
      end
    end
  end
  
  def filter
    @condHash = {}
    params.keys.each do |k|
      if k != 'action' && k != 'controller'
        @condHash[k] = params[k]
      end
    @products = Product.where(@condHash)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end
end
