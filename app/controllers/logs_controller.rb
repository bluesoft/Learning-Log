class LogsController < ApplicationController
 before_filter :authenticate_user!
 
  def index
    @logs = Log.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @logs }
    end
  end
  
  def show
    @log = Log.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @log }
    end
  end

  def new
    @log = Log.new
    @users = User.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @log }
    end
  end


  def edit
    @log = Log.find(params[:id])
    @users = User.all
  end

  def create

    @log = Log.new(params[:log])
    @log.user_id = current_user.id
    
    respond_to do |format|
      if @log.save
        format.html { redirect_to(@log, :notice => 'Log was successfully created.') }
        format.xml  { render :xml => @log, :status => :created, :location => @log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @log.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @log = Log.find(params[:id])
    @log.user_id = current_user.id
    
    respond_to do |format|
      if @log.update_attributes(params[:log])
        format.html { redirect_to(@log, :notice => 'Log was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @log.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @log = Log.find(params[:id])
    @log.destroy

    respond_to do |format|
      format.html { redirect_to(logs_url) }
      format.xml  { head :ok }
    end
  end
end
