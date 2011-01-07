class Blog::PostsController < ApplicationController

unloadable

  # GET /blog/posts
  # GET /blog/posts.xml
  def index
    @posts = Blog::Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /blog/posts/1
  # GET /blog/posts/1.xml
  def show
    @post = Blog::Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /blog/posts/new
  # GET /blog/posts/new.xml
  def new
    @post = Blog::Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /blog/posts/1/edit
  def edit
    @post = Blog::Post.find(params[:id])
  end

  # POST /blog/posts
  # POST /blog/posts.xml
  def create
    @post = Blog::Post.new(params[:blog_post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blog/posts/1
  # PUT /blog/posts/1.xml
  def update
    @post = Blog::Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:blog_post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blog/posts/1
  # DELETE /blog/posts/1.xml
  def destroy
    @post = Blog::Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(blog_posts_url) }
      format.xml  { head :ok }
    end
  end
end
