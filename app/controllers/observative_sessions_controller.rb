#
# Classe controller che implementa le funzionalità CRUD per la 
# classe model "ObservativeSession".
#
class ObservativeSessionsController < ApplicationController
  before_action :set_observative_session, only: [:show, :edit, :update, :destroy]

  # Metodo che recupera le sessioni osservative (eventualmente mediante ricerca), 
  # le ordina, attua una paginazione delle stesse ed in seguito
  # le visualizza.
  def index
    @q = ObservativeSession.ransack(:user)
    @observative_sessions = @q.result.order(params[:order]).paginate(page: params[:page]) if params[:q].present?
    @observative_sessions = @q.result.order(params[:order]).paginate(page: params[:page]) unless params[:q].present?
	@observative_session = ObservativeSession.new
	
	@r = Outing.ransack(params[:r])
	@outings = @r.result.ransack(params[:r]).paginate(page: params[:page]) if params[:r].present?
    @outings = Outing.order('day DESC').paginate(page: params[:page]) unless params[:r].present?
	@outing = Outing.new
 end

  # Metodo ereditato dalla classe ApplicationController.
  def show
    @s = @observative_session.observations.ransack([:q])
    @observations = @s.result.order(params[:order]).paginate(page: params[:page]) if params[:q].present?
    @observations = @s.result.order(params[:order]).paginate(page: params[:page]) unless params[:q].present?
	@observation = @observative_session.observations.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def edit
  end

  # Questo metodo crea un'istanza di ObservativeSession e la salva nel database.
  # Se l'operazione si conclude con successo, avverrà una redirezione alla pagina
  # che presenta i dettagli della sessione osservativa. In caso contrario, verrà
  # visualizzato un messaggio d'errore.
  def create
    @observative_session = current_user.observative_sessions.new(observative_session_params)
   
    respond_to do |format|
      if @observative_session.save
        format.html { redirect_to @observative_session, notice: 'Observative session was successfully created.' }
        format.json { render :show, status: :created, location: @observative_session }
      else 
	  puts current_user.id
	  Rails.logger.info(@observative_session.errors.inspect) 
        format.html { render :new }
        format.json { render json: @observative_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che aggiorna un'istanza di ObservativeSession. Se l'operazione avviene con successo,
  # avverrà una redirezione alla pagina che visualizza i dettagli della sessione osservativa.
  # In caso contrario, verrà visualizzato un messaggio d'errore.
  def update
    respond_to do |format|
      if @observative_session.update(observative_session_params)
        format.html { redirect_to @observative_session, notice: 'Observative session was successfully updated.' }
        format.json { render :show, status: :ok, location: @observative_session }
      else
        format.html { render :edit }
        format.json { render json: @observative_session.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # Metodo che crea un'istanza di ObservativeSession, la quale verrà 
  # passata alla vista corrispondente all'URL "/observative_sessions/1/edit".
  def new
    @observative_session = ObservativeSession.new
  end

  # Metodo che elimina un'istanza di ObservativeSession. Se l'operazione avviene con
  # successo, il browser verrà redirezionato alla lista delle sessioni osservative.
  def destroy
    @observative_session.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Observative session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_observative_session
      @observative_session = ObservativeSession.find(params[:id])
    end

    # Metodo che imposta i parametri richiesti e ammessi durante la creazione o la modifica
    # di un'istanza di ObservativeSession.
    def observative_session_params
      params.require(:observative_session).permit(:date, :start, :end, :name, :latitude, :longitude, :altitude, :bortle, :sqm, :completed, :antoniadi, :pickering, :sky_transparency, :notes)
    end
end
