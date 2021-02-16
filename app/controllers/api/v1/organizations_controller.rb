class Api::V1::OrganizationsController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_organization, only: [:show, :update]
  # before_action :authenticate_user!

  def index
    @organizations = policy_scope(Organization)
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  def show
  end


  def update
    if @organization.update(organization_params)
      render :show
    else
      render_error
    end
  end

  private
  def set_organization
    @organization = Organization.find(params[:id])
    authorize @organization
  end

  def organization_params
    params.require(:organization).permit(:name)
  end

  def render_error
    render json: { errors: @organization.errors.full_messages },
      status: :unprocessable_entity
  end
end
