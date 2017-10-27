#
# Classe controller che implementa le funzionalità CRUD per la classe model "Binocular".
#
class BinocularsController < ApplicationController
  before_action :set_binocular, only: [:show, :edit, :update, :destroy]

  # Metodo che recupera i binocoli (eventualmente mediante ricerca), 
  # li ordina, attua una paginazione degli stessi ed in seguito
  # li visualizza.
  def index
    @q = Binocular.ransack(params[:q])
    @binoculars = @q.result.order(params[:order]).paginate(page: params[:page]) if params[:q].present?
    @binoculars = Binocular.order(params[:order]).paginate(page: params[:page]) unless params[:q].present?
    @binocular = Binocular.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def show
  end

  # Questo metodo crea un'istanza di Binocular, la quale verrà 
  # passata alla vista corrispondente all'URL "/binoculars/1/edit".
  def new
    @binocular = Binocular.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def edit
  end

  # Questo metodo crea un'istanza di Binocular e la salva nel database.
  # Se l'operazione si conclude con successo, avverrà una redirezione alla pagina
  # che presenta i dettagli dello strumento creato. In caso contrario, verrà
  # visualizzato un messaggio d'errore.
  def create
    @binocular = Binocular.new(binocular_params)

    respond_to do |format|
      if @binocular.save
        format.html { redirect_to @binocular, notice: 'Binocular was successfully created.' }
        format.json { render :show, status: :created, location: @binocular }
      else
        format.html { render :new }
        format.json { render json: @binocular.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che aggiorna un'istanza di Binocular. Se l'operazione avviene con successo,
  # avverrà una redirezione alla pagina che visualizza i dettagli dello strumento aggiornato.
  # In caso contrario, verrà visualizzato un messaggio d'errore.
  def update
    respond_to do |format|
      if @binocular.update(binocular_params)
        format.html { redirect_to @binocular, notice: 'Binocular was successfully updated.' }
        format.json { render :show, status: :ok, location: @binocular }
      else
        format.html { render :edit }
        format.json { render json: @binocular.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che elimina un'istanza di Binocular. Se l'operazione avviene con
  # successo, il browser verrà redirezionato alla lista di binocoli.
  def destroy
    @binocular.destroy
    respond_to do |format|
      format.html { redirect_to binoculars_url, notice: 'Binocular was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_binocular
      @binocular = Binocular.find(params[:id])
    end

    # Metodo che imposta i parametri richiesti e ammessi durante la creazione o la modifica
    # di un'istanza di Binocular.
    def binocular_params
      params.require(:binocular).permit(:name, :brand, :description, :magnifications, :notes)
    end
end
