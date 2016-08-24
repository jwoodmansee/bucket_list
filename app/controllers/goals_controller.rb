class GoalsController < ApplicationController
  before_action :bucket
  before_action :goal, expect: [:index, :new, :create]
  def index
    @goals = @buckets.goals
  end

  def show
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = @bucket.goals.new(goal_params)
    if @goal.save
      redirect_to bucket_goal_path(@bucket, @goal)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to bucket_goal_path(@bucket, @goal)
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to bucket_goals_path(@bucket)
  end

  private

  def goal_params
    parms.require(:goal).permit(:goal, :description, :completed)
  end

  def bucket
    @bucket = Bucket.find(params[:bucket_id])
  end

  def goal
    @goal = @bucket.goals.find(params[:id])
  end
end
