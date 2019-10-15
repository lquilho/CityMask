class FixpointAttachmentsController < ApplicationController
  before_action :find_fixpoint_attch, only: [:edit, :update, :destroy]
  before_action :set_fixpoint

  def new
    @fixpoint_attachment = FixpointAttachment.new
    authorize @fixpoint_attachment
  end

  def create
    @fixpoint_attachment = FixpointAttachment.new(fixpoint_attachment_params)
    authorize @fixpoint_attachment

    respond_to do |format|
      if @fixpoint_attachment.save
        format.html { redirect_to request.referrer, notice: 'fixpoint attachment was successfully uploaded'}
      else
        format.html { render :new, notice: 'fixpoint attachment error' }
      end
    end
  end

  def edit
    authorize @fixpoint_attachment
  end

  def update
    authorize @fixpoint_attachment

    respond_to do |format|
      if @fixpoint_attachment.update(fixpoint_attachment_params)
        format.html { redirect_to fixpoint_path(@fixpoint), notice: 'fixpoint attachment was successfully updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @fixpoint_attachment

    @fixpoint_attachment.destroy

    redirect_to fixpoint_path(@fixpoint)
  end


  private

  def find_fixpoint_attch
    @fixpoint_attachment = FixpointAttachment.find(params[:id])
  end

  def set_fixpoint
    @fixpoint = Fixpoint.find(params[:fixpoint_id])
  end

  def fixpoint_attachment_params
    params.require(:fixpoint_attachment).permit(:fixpoint_id, :photo, :fixed).merge( { fixpoint_id: params[:fixpoint_id] } )
  end
end
