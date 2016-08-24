class BucketsController < ApplicationController
  before_action :bucket, except:[:index, :new, :create]

  def index
    @buckets = Bucket.all
  end

  def show
  end

  def new
    @bucket = Bucket.new
  end

  def create
    @bucket = Bucket.new(bucket_params)
    if @bucket.save
      redirect_to bucket_path(@bucket)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bucket.update(bucket_params)
      redirect_to bucket_path(@bucket)
    else 
      render :edit
    end
  end

  private

  def bucket_params
    params.require(:bucket).permit(:name)
  end

  def bucket
    @bucket = Bucket.find(params[:id])
  end

end
