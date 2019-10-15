class FixpointsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_fixpoint, only: [:show, :edit, :update, :set_fixed]

  def index
    @fixpoints = policy_scope(Fixpoint).order("created_at DESC")

    if params[:filter] == 'fixed'
      @fixpoints = policy_scope(Fixpoint).where(fixed: true)
    elsif params[:filter] == 'not-fixed'
      @fixpoints = policy_scope(Fixpoint).where(fixed: false)
    elsif params[:filter] == 'my-fixes'
      @fixpoints = current_user.fixpoints.where.not(latitude: nil, longitude: nil)
    end

    @markers = @fixpoints.order(:created_at).map do |fixpoint|
      {
        lat: fixpoint.latitude,
        lng: fixpoint.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { fixpoint: fixpoint }),
        image_url: url_for_marker(fixpoint),
        newly_created: params[:newly_created_id].to_i == fixpoint.id
      }
    end
  end

  def show
    @fixpoint_attachments = @fixpoint.fixpoint_attachments.all
    authorize @fixpoint
  end

  def new
    @fixpoint = Fixpoint.new
    @fixpoint_attachment = @fixpoint.fixpoint_attachments.build
    authorize @fixpoint
  end

  def create
    @fixpoint = Fixpoint.new(fixpoint_params)
    @fixpoint.user = current_user

    if params[:fixpoint_attachments]
      build_photos
    else
      @fixpoint.fixpoint_attachments.build
    end

    authorize @fixpoint

    if @fixpoint.save
      path = fixpoints_path(
        center_lat: @fixpoint.latitude,
        center_lon: @fixpoint.longitude,
        newly_created_id: @fixpoint.id
      )

      redirect_to path, notice: 'fixpoint was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    authorize @fixpoint
  end

  def update
    if @fixpoint.update(fixpoint_params)
      redirect_to @fixpoint
    else
      render :edit
    end
  end

  def set_fixed
    authorize @fixpoint

    @fixpoint.fixed = !@fixpoint.fixed

    if @fixpoint.save
      respond_to do |format|
        format.html { redirect_to new_fixpoint_fixpoint_attachment_path(@fixpoint) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
        flash[:notice] = "It is really easy to share a photo of the fix. 📸"
      end
    end
  end

  private

  def build_photos
    params[:fixpoint_attachments]['photo'].each do |photo|
      @fixpoint.fixpoint_attachments.build(photo: photo)
    end
  end

  def set_fixpoint
    @fixpoint = Fixpoint.find(params[:id])
  end

  def fixpoint_params
    params.require(:fixpoint).permit(:address, :category, :longitude, :latitude, :fix_date, :fixed,
                                     fixpoint_attachments_attributes: [:id, :fixpoint_id, :photo])
  end

  def url_for_marker(fixpoint)
    if fixpoint.user == current_user
      helpers.asset_url('placeholder3.png')
    elsif fixpoint.fixed? == false
      helpers.asset_url('placeholder1.png')
    else
      helpers.asset_url('placeholder2.png')
    end
  end
end
