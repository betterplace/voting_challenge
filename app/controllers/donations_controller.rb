class DonationsController < ApplicationController
  before_action :set_donation, only: %i[ show edit update destroy ]
  # following line makes the cURL request from the README work
  skip_before_action :verify_authenticity_token, only: [ :create ] if Rails.env.development?

  # GET /donations or /donations.json
  def index
    @donations = Donation.all
  end

  # GET /donations/1 or /donations/1.json
  def show
  end

  # GET /donations/new
  def new
    @donation = Donation.new
  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations or /donations.json
  def create
    result = Donate.new.call(donation_params["receiver_id"], donation_params["amount_in_cents"])
    @donation = result.donation

    respond_to do |format|
      if result.success
        format.html { redirect_to @donation, notice: "Donation was successfully created." }
        format.json { render :show, status: :created, location: @donation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donations/1 or /donations/1.json
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to @donation, notice: "Donation was successfully updated." }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1 or /donations/1.json
  def destroy
    @donation.destroy!

    respond_to do |format|
      format.html { redirect_to donations_path, status: :see_other, notice: "Donation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def donation_params
      params.require(:donation).permit(:amount_in_cents, :receiver_id)
    end
end
