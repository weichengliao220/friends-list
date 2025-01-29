class FriendsController < ApplicationController
  before_action :set_friend, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :correct_user, only: %i[ edit update destroy ]
  # GET /friends or /friends.json
  def index
    if params[:query].present?
      @friends = Friend.where("LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ? OR LOWER(email) LIKE ?",
                              "%#{params[:query].downcase}%", "%#{params[:query].downcase}%", "%#{params[:query].downcase}%")
                      .paginate(page: params[:page], per_page: 12)
    else
      @friends = Friend.paginate(page: params[:page], per_page: 12)
    end
    puts "Filtered friends: #{@friends.inspect}"
  end

  # GET /friends/1 or /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    # @friend = Friend.new
    @friend = current_user.friends.build
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends or /friends.json
  def create
    # @friend = Friend.new(friend_params)
    @friend = current_user.friends.build(friend_params)

    respond_to do |format|
      if @friend.save
        format.html { redirect_to @friend, notice: "Friend was successfully added." }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    @friend.destroy!

    respond_to do |format|
      format.html { redirect_to friends_path, status: :see_other, notice: "Friend was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @friend = current_user.friends.find_by(id: params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
      redirect_to friends_path, notice: "Not authorized to edit this friend" if @friend.user != current_user
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :email, :phone, :address, :user_id)
    end
end
