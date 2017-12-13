#
# Classe controller che implementa le funzionalità CRUD per 
# la classe model "Location".
# 
class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # Metodo che recupera i luoghi (eventualmente mediante ricerca), 
  # li ordina, attua una paginazione degli stessi ed in seguito
  # li visualizza.
  def index
	if params[:order] == nil
    params[:order] = 'created_at DESC'
	end
    @q = Location.ransack(params[:q])
    @locations = @q.result.order(params[:order]).paginate(page: params[:page]) if params[:q].present?
    @locations = Location.order(params[:order]).paginate(page: params[:page]) unless params[:q].present?
    @location = Location.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def show
  end

  # Metodo che crea un'istanza di Filter, la quale verrà 
  # passata alla vista corrispondente all'URL "/locations/1/edit".
  def new
    @location = Location.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def edit
  end

  # Questo metodo crea un'istanza di Location e la salva nel database.
  # Se l'operazione si conclude con successo, avverrà una redirezione alla pagina
  # che presenta i dettagli del luogo. In caso contrario, verrà
  # visualizzato un messaggio d'errore.
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che aggiorna un'istanza di Location. Se l'operazione avviene con successo,
  # avverrà una redirezione alla pagina che visualizza i dettagli del luogo.
  # In caso contrario, verrà visualizzato un messaggio d'errore.
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che elimina un'istanza di Location. Se l'operazione avviene con
  # successo, il browser verrà redirezionato alla lista dei luoghi.
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    # Metodo che imposta i parametri richiesti e ammessi durante la creazione o la modifica
    # di un'istanza di CelestialBody.
    def location_params
      params.require(:location).permit(:name, :latitude, :longitude, :altitude, :bortle, :sqm, :notes)
    end
end
