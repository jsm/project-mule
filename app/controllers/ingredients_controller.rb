class IngredientsController < ApplicationController
    # GET /ingredients
    # GET /ingredients.json
    load_and_authorize_resource
    def index
        @ingredients = Ingredient.page(params[:page])

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @ingredients }
        end
    end

    # GET /ingredients/1
    # GET /ingredients/1.json
    def show
        @ingredient = Ingredient.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @ingredient }
        end
    end

    # GET /ingredients/new
    # GET /ingredients/new.json
    def new
        @ingredient = Ingredient.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @ingredient }
        end
    end

    # GET /ingredients/1/edit
    def edit
        @ingredient = Ingredient.find(params[:id])
    end

    # POST /ingredients
    # POST /ingredients.json
    def create
        @ingredient = Ingredient.new(params[:ingredient])

        broken = false
        @ingredient.attributes.each do |name, value|
            if ((value == nil || value == "") && (name != "id" && name != "created_at" && name != "updated_at" ))
                broken = true
                #puts "name: #{name} value: #{value}"
                break
            end
        end

        if broken
            redirect_to new_ingredient_path, notice: 'Error: empty fields!'
        else
            respond_to do |format|
                if @ingredient.save
                    format.html { redirect_to @ingredient, notice: 'Ingredient was successfully created.' }
                    format.json { render json: @ingredient, status: :created, location: @ingredient }
                else
                    format.html { render action: "new" }
                    format.json { render json: @ingredient.errors, status: :unprocessable_entity }
                end
            end
        end
    end

    # PUT /ingredients/1
    # PUT /ingredients/1.json
    def update
        @ingredient = Ingredient.find(params[:id])

        respond_to do |format|
            if @ingredient.update_attributes(params[:ingredient])
                format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @ingredient.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /ingredients/1
    # DELETE /ingredients/1.json
    def destroy
        @ingredient = Ingredient.find(params[:id])
        @ingredient.destroy

        respond_to do |format|
            format.html { redirect_to ingredients_url }
            format.json { head :no_content }
        end
    end
end
