#
# Classe controller che implementa le funzionalità CRUD per la 
# classe model "ObservativeSession".
#
class ObservationsController < ApplicationController
  before_action :set_observation, only: [:show, :edit, :update, :destroy]

  # Metodo che recupera le sessioni osservative (eventualmente mediante ricerca), 
  # le ordina, attua una paginazione delle stesse ed in seguito
  # le visualizza.
  def index
    @r = Observation.ransack(:observative_session)
    @observations = @r.result.order(params[:order]).paginate(page: params[:page]) if params[:q].present?
    @observations = Observation.order(params[:order]).paginate(page: params[:page]) unless params[:q].present?
	@observation = Observation.new
 end

  # Metodo ereditato dalla classe ApplicationController.
  def show
  end

  # Metodo ereditato dalla classe ApplicationController.
  def edit
  end

  # Questo metodo crea un'istanza di ObservativeSession e la salva nel database.
  # Se l'operazione si conclude con successo, avverrà una redirezione alla pagina
  # che presenta i dettagli della sessione osservativa. In caso contrario, verrà
  # visualizzato un messaggio d'errore.
  def create
    @observation = @observative_session.observations.build(observation_params)
   
    respond_to do |format|
      if @observation.save
        format.html { redirect_to @observation, notice: 'Observative session was successfully created.' }
        format.json { render :show, status: :created, location: @observation }
      else 
	  puts current_user.id
	  Rails.logger.info(@observation.errors.inspect) 
        format.html { render :new }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che aggiorna un'istanza di ObservativeSession. Se l'operazione avviene con successo,
  # avverrà una redirezione alla pagina che visualizza i dettagli della sessione osservativa.
  # In caso contrario, verrà visualizzato un messaggio d'errore.
  def update
    respond_to do |format|
      if @observation.update(observation_params)
        format.html { redirect_to @observation, notice: 'Observative session was successfully updated.' }
        format.json { render :show, status: :ok, location: @observation }
      else
        format.html { render :edit }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # Metodo che crea un'istanza di ObservativeSession, la quale verrà 
  # passata alla vista corrispondente all'URL "/observations/1/edit".
  def new
    @observation = Observation.new
  end

  # Metodo che elimina un'istanza di ObservativeSession. Se l'operazione avviene con
  # successo, il browser verrà redirezionato alla lista delle sessioni osservative.
  def destroy
    @observation.destroy
    respond_to do |format|
      format.html { redirect_to observation_url, notice: 'Observative session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_observation
      @observation = Observation.find(params[:id])
    end

    # Metodo che imposta i parametri richiesti e ammessi durante la creazione o la modifica
    # di un'istanza di ObservativeSession.
    def observation_params
      params.require(:observation).permit(:start_time, :celestial_body_name, :binocular_id, :telescope_id, :eyepiece_id, :filter_id, :rating, :description, :notes)
    end
end
