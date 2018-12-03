class ArticalsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

    def index
      @articals = Artical.all
    end

    def new
      @artical = Artical.new
    end

    def edit
      @artical = Artical.find(params[:id])
    end

    def show
      @artical = Artical.find(params[:id])
    end

    def create
      @artical = Artical.new(artical_params)
      if @artical.save
        redirect_to @artical
      else
        render 'new'
      end
    end

    def update
      @artical = Artical.find(params[:id])

      if
        @artical.update(artical_params)
        redirect_to   @artical
      else
        render 'edit'
      end
    end

    def destroy
      @artical = Artical.find(params[:id])
      @artical.destroy

      redirect_to articals_path
    end


    private

    def artical_params
      params.require(:artical).permit(:title, :text)
    end
  end
