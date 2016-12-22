class Admin::CatalogsController < Admin::BaseController
  before_action :set_admin_catalog, only: [:edit, :update, :destroy]

  # GET /admin/catalogs
  def index
    authorize Catalog
    respond_to do |format|
      format.html
      format.json do
        @catalogs = Catalog.roots
        render json: @catalogs
      end
    end
  end

  # GET /admin/catalogs/1
  def show
    authorize @admin_catalog
  end

  # GET /admin/catalogs/new
  def new
    authorize Catalog
    @admin_catalog = Catalog.new
  end

  # GET /admin/catalogs/1/edit
  def edit
    authorize @admin_catalog
  end

  # POST /admin/catalogs
  def create
    authorize Catalog
    @admin_catalog = Catalog.new(admin_catalog_params)
    if @admin_catalog.save
      render json: @admin_catalog
    else
      head 403
    end
  end

  # PATCH/PUT /admin/catalogs/1
  def update
    authorize @admin_catalog
    if @admin_catalog.update(admin_catalog_params)
      render json: {status: 'Catalog 更新成功.'}
    else
      render json: {status: 'Catalog 更新失败.'}
    end
  end

  # DELETE /admin/catalogs/1
  def destroy
    authorize @admin_catalog
    @admin_catalog.destroy
    render json: {status: 'Catalog 删除成功.'}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_catalog
      @admin_catalog = Catalog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_catalog_params
      params.permit(:parent_id, :name, :position)
    end
end
