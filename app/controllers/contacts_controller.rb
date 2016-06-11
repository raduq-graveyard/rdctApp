class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/search/1
  def search
    if params[:filter_id]
      @filter = Filter.find params[:filter_id]

      query = define_query(@filter)
      value = define_value(@filter)
      @contacts = Contact.where query, value
    else
      index
    end

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

  def define_query(filter)
    upcase_filter = filter.operation.to_s.upcase
    case upcase_filter
      when 'LIKE'
        return filter.query + ' LIKE :like_name'
      when 'EQUALS'
        return filter.query + ' = :like_name'
      when 'STARTS_WITH'
        return filter.query + ' LIKE :like_name'
      when 'ENDS_WITH'
        return filter.query + ' LIKE :like_name'
      when 'GREATER'
        return filter.query + ' > :like_name'
      when 'GREATER_EQUALS'
        return filter.query + ' >= :like_name'
      when 'LESSER'
        return filter.query + ' < :like_name'
      when 'LESSER_EQUALS'
        return filter.query + ' <= :like_name'
    end
  end

  def define_value(filter)
    upcase_filter = filter.operation.to_s.upcase
    case upcase_filter
      when 'LIKE'
        return {:like_name => "%#{filter.value}%"}
      when 'EQUALS'
        return {:like_name => "#{filter.value}"}
      when 'STARTS_WITH'
        return {:like_name => "#{filter.value}%"}
      when 'ENDS_WITH'
        return {:like_name => "%#{filter.value}"}
      when 'GREATER'
        return {:like_name => "#{filter.value}"}
      when 'GREATER_EQUALS'
        return {:like_name => "#{filter.value}"}
      when 'LESSER'
        return {:like_name => "#{filter.value}"}
      when 'LESSER_EQUALS'
        return {:like_name => "#{filter.value}"}
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:name, :mail, :age, :state, :role)
  end
end
