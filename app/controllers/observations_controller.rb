#
# Classe controller che implementa le funzionalità CRUD per la classe model "Observation".
#
class ObservationsController < ApplicationController
  before_action :set_observation, only: [:show, :edit, :update, :destroy]

  # Metodo che recupera i telescopi (eventualmente mediante ricerca), 
  # li ordina, attua una paginazione degli stessi ed in seguito
  # li visualizza.
  def index
  #@s = Observation.ransack(:observative_session)
  #@observations = @s.result.order(params[:order]).paginate(page: params[:page]) if params[:s].present?
  #@observations = @s.result.order(params[:order]).paginate(page: params[:page]) unless params[:s].present?
  #@observation = Observation.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def show
  end

  # GET /observations/new
  def new
	@observative_session = ObservativeSession.find(params[:observative_session_id])
    @observation = Observation.new(observative_session: @observative_session)
	@observation.user_id = @observative_session.user_id
  end

  # Metodo ereditato dalla classe ApplicationController.
  def edit
	@observative_session = ObservativeSession.find(params[:observative_session_id])
	@observation = @observative_session.observations.find(params[:id])
  end

  # Questo metodo crea un'istanza di Observation e la salva nel database.
  # Se l'operazione si conclude con successo, avverrà una redirezione alla pagina
  # che presenta i dettagli dello strumento creato. In caso contrario, verrà
  # visualizzato un messaggio d'errore.
  def create
    @observative_session = ObservativeSession.find(params[:observative_session_id])
    @observation = @observative_session.observations.build(observation_params)
	@observation.user_id = current_user.id
	
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
	@observative_session = ObservativeSession.find(params[:observative_session_id])
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
      format.html { redirect_to observative_session_url(@observation.observative_session_id), notice: 'Observation was successfully destroyed.' }
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
