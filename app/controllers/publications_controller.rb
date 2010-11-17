class PublicationsController < ApplicationController

  def index
    @publications = Publication.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @publications }
    end
  end
  
  def new
    @publication = Publication.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @publication }
    end
  end

  def create
    @publication = Publication.new(params[:publication])
    @publication = Publication.create(params[:publication] )

    respond_to do |format|
      if @publication.save
        format.html { redirect_to(@publication, :notice => 'Publication was successfully created.') }
        format.xml  { render :xml => @publication, :status => :created, :location => @invoice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @publication.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @publication = Publication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @publication }
    end
  end
  
  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find(params[:id])

    respond_to do |format|
      if @publication.update_attributes(params[:publication])
        format.html { redirect_to(@publication, :notice => 'Publication was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @publication.errors, :status => :unprocessable_entity }
      end
    end
  end
  
    def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy

	respond_to do |format|
	  format.html { redirect_to(publications_url) }
	  format.xml  { head :ok }
	end
  end
  
end
