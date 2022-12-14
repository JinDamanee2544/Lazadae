class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :must_be_log_in
  before_action :must_be_admin

  # def delete_unused_item
  #   # Delete all unused item that do not appear in any inventory
  #   # This is for Admin to clean up the database

  #   Item.all.each do |item|
  #     if item.inventories.empty? and item.markets.empty?
  #       puts "Delete #{item}"
  #       item.destroy
  #     end
  #   end
  #   redirect_to items_path , notice: "Unused Item has been removed"
  # end

  def enableAllItem 
    Item.all.each do |item|
      item.update(enable: true)
    end
    redirect_to items_path , notice: "All Item has been enabled"
  end

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        if (!item_params[:picture].nil?)
          @item.picture.attach(item_params[:picture])
        end
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :category, :enable,:picture,:lock_version)
    end
end
