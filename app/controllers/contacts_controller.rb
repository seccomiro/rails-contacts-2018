class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def search
    @kinds = Kind.order(:description)
  end

  def search_result
    @kinds = Kind.order(:description)

    @search_params = params[:search]
    kind = Kind.find_by_id @search_params[:kind_id]
    @contacts = Contact
                  .includes(:kind, :company)
                  .where('name like ?', "%#{@search_params[:name]}%")
                  .order(:name)
    @contacts = @contacts.where(kind: kind) if kind

    render 'search'
  end

  # GET /contacts
  # GET /contacts.json
  def index
    order = params[:order] || 'asc'
    @new_order = order == 'desc' ? 'asc' : 'desc'
    @contacts = Contact
                  .includes(:kind, :company)
                  .order(name: order)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :remark, :kind_id, :company_id)
    end
end
