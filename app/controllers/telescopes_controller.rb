#
# Classe controller che implementa le funzionalità CRUD per la classe model "Telescope".
#
class TelescopesController < ApplicationController
  before_action :set_telescope, only: [:show, :edit, :update, :destroy]

  # Metodo che recupera i telescopi (eventualmente mediante ricerca), 
  # li ordina, attua una paginazione degli stessi ed in seguito
  # li visualizza.
  def index
    @q = Telescope.ransack(params[:q])
    @telescopes = @q.result.order(params[:order]).paginate(page: params[:page]) if params[:q].present?
    @telescopes = Telescope.order(params[:order]).paginate(page: params[:page]) unless params[:q].present?
    @telescope = Telescope.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def show
  end

  # GET /telescopes/new
  def new
    @telescope = Telescope.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def edit
  end

  # Questo metodo crea un'istanza di Telescope e la salva nel database.
  # Se l'operazione si conclude con successo, avverrà una redirezione alla pagina
  # che presenta i dettagli dello strumento creato. In caso contrario, verrà
  # visualizzato un messaggio d'errore.
  def create
    @telescope = Telescope.new(telescope_params)

    respond_to do |format|
      if @telescope.save
        format.html { redirect_to @telescope, notice: 'Telescope was successfully created.' }
        format.json { render :show, status: :created, location: @telescope }
      else
        format.html { render :new }
        format.json { render json: @telescope.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che aggiorna un'istanza di Telescope. Se l'operazione avviene con successo,
  # avverrà una redirezione alla pagina che visualizza i dettagli dello strumento aggiornato.
  # In caso contrario, verrà visualizzato un messaggio d'errore.
  def update
    respond_to do |format|
      if @telescope.update(telescope_params)
        format.html { redirect_to @telescope, notice: 'Telescope was successfully updated.' }
        format.json { render :show, status: :ok, location: @telescope }
      else
        format.html { render :edit }
        format.json { render json: @telescope.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che elimina un'istanza di Telescope. Se l'operazione avviene con
  # successo, il browser verrà redirezionato alla lista di telescopi.
  def destroy
    @telescope.destroy
    respond_to do |format|
      format.html { redirect_to telescopes_url, notice: 'Telescope was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_telescope
      @telescope = Telescope.find(params[:id])
    end

    # Metodo che imposta i parametri richiesti e ammessi durante la creazione o la modifica
    # di un'istanza di Telescope.
    def telescope_params
      params.require(:telescope).permit(:brand, :name, :description, :notes, :angular_resolution, :magnitude, :focal_ratio, :finderscope, :focal_length, :mount, :aperture, :typology)
    end
end
