# frozen_string_literal: true

class WikiPostsController < ApplicationController
  include LoggingModule
<<<<<<< HEAD
  before_action :set_wiki_post, only: %i[edit update destroy]
=======
  before_action :set_wiki_post, only: %i[show edit update destroy]
>>>>>>> psdeb2

  # GET /wiki_posts or /wiki_posts.json
  def index
    @wiki_posts = WikiPost.all
<<<<<<< HEAD
    log_debug("WikiPosts Loaded - count: #{@wiki_posts.count}")
=======
    log_debug("WikiPostsLoaded: #{@wiki_posts.count}")
>>>>>>> psdeb2
  end

  # GET /wiki_posts/1 or /wiki_posts/1.json
  def show
    log_info("WikiPost viewed: #{@wiki_post.title}")
  end

  def example; end

  # GET /wiki_posts/new
  def new
    @wiki_post = WikiPost.new
  end

  # GET /wiki_posts/1/edit
  def edit; end

  # POST /wiki_posts or /wiki_posts.json
  def create
    @wiki_post = WikiPost.new(wiki_post_params)

    respond_to do |format|
      if @wiki_post.save
        format.html { redirect_to wiki_post_url(@wiki_post), notice: 'Wiki post was successfully created.' }
        format.json { render :show, status: :created, location: @wiki_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wiki_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wiki_posts/1 or /wiki_posts/1.json
  def update
    respond_to do |format|
      if @wiki_post.update(wiki_post_params)
        format.html { redirect_to wiki_post_url(@wiki_post), notice: 'Wiki post was successfully updated.' }
        format.json { render :show, status: :ok, location: @wiki_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wiki_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wiki_posts/1 or /wiki_posts/1.json
  def destroy
    @wiki_post.destroy

    respond_to do |format|
      format.html { redirect_to wiki_posts_url, notice: 'Wiki post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_wiki_post
    @wiki_post = WikiPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
<<<<<<< HEAD
    log_error("WikiPost not found - ID: #{params[:id]}")
    redirect_to wiki_posts_path, alert: 'WikiPost not found.'
=======
    log_error("not found id - #{params[:id]}")
    redirect_to wiki_posts_path, alert: 'Wiki post not found.'
>>>>>>> psdeb2
  end

  # Only allow a list of trusted parameters through.
  def wiki_post_params
    params.fetch(:wiki_post, {}).permit(:title, :description, :author, :image)
  end
end
