#
# Classe controller che implementa le funzionalità CRUD per la classe model "Filter".
#
class FiltersController < ApplicationController
  before_action :set_filter, only: [:show, :edit, :update, :destroy]

  # Metodo che recupera i filtri (eventualmente mediante ricerca), 
  # li ordina, attua una paginazione degli stessi ed in seguito
  # li visualizza.
  def index
    @q = Filter.ransack(params[:q])
    @filters = @q.result.order(params[:order]).paginate(page: params[:page]) if params[:q].present?
    @filters = Filter.order(params[:order]).paginate(page: params[:page]) unless params[:q].present?
    @filter = Filter.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def show
  end

  # Metodo che crea un'istanza di Filter, la quale verrà 
  # passata alla vista corrispondente all'URL "/filters/1/edit".
  def new
    @filter = Filter.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def edit
  end

  # Questo metodo crea un'istanza di Filter e la salva nel database.
  # Se l'operazione si conclude con successo, avverrà una redirezione alla pagina
  # che presenta i dettagli dello strumento creato. In caso contrario, verrà
  # visualizzato un messaggio d'errore.
  def create
    @filter = Filter.new(filter_params)

    respond_to do |format|
      if @filter.save
        format.html { redirect_to @filter, notice: 'Filter was successfully created.' }
        format.json { render :show, status: :created, location: @filter }
      else
        format.html { render :new }
        format.json { render json: @filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che aggiorna un'istanza di Filter. Se l'operazione avviene con successo,
  # avverrà una redirezione alla pagina che visualizza i dettagli dello strumento aggiornato.
  # In caso contrario, verrà visualizzato un messaggio d'errore.
  def update
    respond_to do |format|
      if @filter.update(filter_params)
        format.html { redirect_to @filter, notice: 'Filter was successfully updated.' }
        format.json { render :show, status: :ok, location: @filter }
      else
        format.html { render :edit }
        format.json { render json: @filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che elimina un'istanza di Filter. Se l'operazione avviene con
  # successo, il browser verrà redirezionato alla lista di filtri.
  def destroy
    @filter.destroy
    respond_to do |format|
      format.html { redirect_to filters_url, notice: 'Filter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_filter
      @filter = Filter.find(params[:id])
    end

    # Metodo che imposta i parametri richiesti e ammessi durante la creazione o la modifica
    # di un'istanza di Filter.
    def filter_params
      params.require(:filter).permit(:name, :brand, :description, :notes)
    end
end
