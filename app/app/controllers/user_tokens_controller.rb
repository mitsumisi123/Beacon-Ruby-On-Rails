class UserTokensController < ApplicationController
  before_action :set_user_token, only: [:show, :update, :destroy]

  # GET /user_tokens
  def index
    @user_tokens = UserToken.all

    render json: @user_tokens
  end

  # GET /user_tokens/1
  def show
    render json: @user_token
  end

  # POST /user_tokens
  def create
    @token = UserToken.where(user_token_params)
    if(@token.empty?)
      @user_token = UserToken.new(user_token_params)

      if @user_token.save
        render json: @user_token, status: :created, location: @user_token
      else
        render json: @user_token.errors, status: :unprocessable_entity
      end
    else
      render json: {message: "Already exist"}
    end
  end

  # PATCH/PUT /user_tokens/1
  def update
    if @user_token.update(user_token_params)
      render json: @user_token
    else
      render json: @user_token.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_tokens/1
  def destroy
    @user_token.destroy
  end

  #DELETE /user_tokens
  def destroy_by_token
    @token = UserToken.where(user_token_params)
    if @token
      UserToken.destroy(@token[0]["id"])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_token
      @user_token = UserToken.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_token_params
      params.require(:user_token).permit(:user_id, :divice_token)
    end
end
