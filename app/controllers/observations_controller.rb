#
# Classe controller che implementa le funzionalità CRUD per la classe model "Observation".
#
class ObservationsController < ApplicationController
  before_action :set_observation, only: [:show, :edit, :update, :destroy]

  # Metodo che recupera i telescopi (eventualmente mediante ricerca), 
  # li ordina, attua una paginazione degli stessi ed in seguito
  # li visualizza.
  def index
    @s = @observative_session.observations.ransack([:q])
    @observations = @s.result.order(params[:order]).paginate(page: params[:page]) if params[:q].present?
    @observations = Observation.order(params[:order]).paginate(page: params[:page]) unless params[:q].present?
	@observation = @observative_session.observations.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def show
  end

  # GET /observations/new
  def new
    @observation = @observative_session.observations.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def edit
  end

  # Questo metodo crea un'istanza di Observation e la salva nel database.
  # Se l'operazione si conclude con successo, avverrà una redirezione alla pagina
  # che presenta i dettagli dello strumento creato. In caso contrario, verrà
  # visualizzato un messaggio d'errore.
  def create
    @observation = @observative_session.observations.new(observation_params)

    respond_to do |format|
      if @observation.save
        format.html { redirect_to [@observative_session, @observation], notice: 'Observation was successfully created.' }
        format.json { render :show, status: :created, location: @observation }
      else
        format.html { render :new }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che aggiorna un'istanza di Observation. Se l'operazione avviene con successo,
  # avverrà una redirezione alla pagina che visualizza i dettagli dello strumento aggiornato.
  # In caso contrario, verrà visualizzato un messaggio d'errore.
  def update
    respond_to do |format|
      if @observation.update(observation_params)
        format.html { redirect_to [@observative_session, @observation], notice: 'Observation was successfully updated.' }
        format.json { render :show, status: :ok, location: @observation }
      else
        format.html { render :edit }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che elimina un'istanza di Observation. Se l'operazione avviene con
  # successo, il browser verrà redirezionato alla lista di telescopi.
  def destroy
    @observation.destroy
    respond_to do |format|
      format.html { redirect_to observative_session_url, notice: 'Observation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_observation
      @observation = Observation.find(params[:id])
    end

    # Metodo che imposta i parametri richiesti e ammessi durante la creazione o la modifica
    # di un'istanza di Observation.
    def observation_params
      params.require(:observation).permit(:start_time, :celestial_body_name, :telescope_name, :binocular_name, :filter_name, :eyepiece_name, :rating, :description, :notes)
    end
end
