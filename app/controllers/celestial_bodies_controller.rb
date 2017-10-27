#
# Classe controller che implementa le funzionalità CRUD per 
# la classe model "CelestialBody".
# 
class CelestialBodiesController < ApplicationController
  before_action :set_celestial_body, only: [:show, :edit, :update, :destroy]

  # Metodo che recupera i corpi celesti (eventualmente mediante ricerca), 
  # li ordina, attua una paginazione degli stessi ed in seguito
  # li visualizza.
  def index
    @q = CelestialBody.ransack(params[:q])
    @celestial_bodies = @q.result.order(params[:order]).paginate(page: params[:page]) if params[:q].present?
    @celestial_bodies = CelestialBody.order(params[:order]).paginate(page: params[:page]) unless params[:q].present?
    @celestial_body = CelestialBody.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def show
  end

  # Metodo che crea un'istanza di Filter, la quale verrà 
  # passata alla vista corrispondente all'URL "/celestial_bodies/1/edit".
  def new
    @celestial_body = CelestialBody.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def edit
  end

  # Questo metodo crea un'istanza di CelestialBody e la salva nel database.
  # Se l'operazione si conclude con successo, avverrà una redirezione alla pagina
  # che presenta i dettagli del corpo celeste. In caso contrario, verrà
  # visualizzato un messaggio d'errore.
  def create
    @celestial_body = CelestialBody.new(celestial_body_params)

    respond_to do |format|
      if @celestial_body.save
        format.html { redirect_to @celestial_body, notice: 'Celestial body was successfully created.' }
        format.json { render :show, status: :created, location: @celestial_body }
      else
        format.html { render :new }
        format.json { render json: @celestial_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che aggiorna un'istanza di CelestialBody. Se l'operazione avviene con successo,
  # avverrà una redirezione alla pagina che visualizza i dettagli del corpo celeste.
  # In caso contrario, verrà visualizzato un messaggio d'errore.
  def update
    respond_to do |format|
      if @celestial_body.update(celestial_body_params)
        format.html { redirect_to @celestial_body, notice: 'Celestial body was successfully updated.' }
        format.json { render :show, status: :ok, location: @celestial_body }
      else
        format.html { render :edit }
        format.json { render json: @celestial_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che elimina un'istanza di CelestialBody. Se l'operazione avviene con
  # successo, il browser verrà redirezionato alla lista dei corpi celesti.
  def destroy
    @celestial_body.destroy
    respond_to do |format|
      format.html { redirect_to celestial_bodies_url, notice: 'Celestial body was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_celestial_body
      @celestial_body = CelestialBody.find(params[:id])
    end

    # Metodo che imposta i parametri richiesti e ammessi durante la creazione o la modifica
    # di un'istanza di CelestialBody.
    def celestial_body_params
      params.require(:celestial_body).permit(:name, :typology, :size, :constellation, :map_chart_number)
    end
end
