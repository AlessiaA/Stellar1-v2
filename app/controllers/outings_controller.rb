#
# Classe controller che implementa le funzionalità CRUD per la classe model "Outing".
#
class OutingsController < ApplicationController
  before_action :set_outing, only: [:show, :edit, :update, :destroy]

  # Metodo che recupera le uscite (eventualmente mediante ricerca), 
  # le ordina, attua una paginazione delle stesse ed in seguito
  # le visualizza.
  def index
	@q = Outing.ransack(params[:q])
    @outings = @q.result.order(params[:order]).paginate(page: params[:page]) if params[:q].present?
    @outings = Outing.order(params[:order]).paginate(page: params[:page]) unless params[:q].present?
	@outing = Outing.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def show
  end

 # Questo metodo crea un'istanza di Outing e la salva nel database.
  # Se l'operazione si conclude con successo, avverrà una redirezione alla pagina
  # che presenta i dettagli dello strumento creato. In caso contrario, verrà
  # visualizzato un messaggio d'errore.
  def create
    @outing = Outing.new(outing_params)

    respond_to do |format|
      if @outing.save
        format.html { redirect_to @outing, notice: 'Outing was successfully created.' }
        format.json { render :show, status: :created, location: @outing }
      else
        format.html { render :new }
        format.json { render json: @outing.errors, status: :unprocessable_entity }
      end
    end
  end 

 # Questo metodo crea un'istanza di Outing, la quale verrà 
  # passata alla vista corrispondente all'URL "/outings/1/edit".
  def new
    @outing = Outing.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def edit
  end

  # Metodo che aggiorna un'istanza di Outing. Se l'operazione avviene con successo,
  # avverrà una redirezione alla pagina che visualizza i dettagli dello strumento aggiornato.
  # In caso contrario, verrà visualizzato un messaggio d'errore.
  def update
    respond_to do |format|
      if @outing.update(outing_params)
        format.html { redirect_to @outing, notice: 'Outing was successfully updated.' }
        format.json { render :show, status: :ok, location: @outing }
      else
        format.html { render :edit }
        format.json { render json: @outing.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che elimina un'istanza di Outing. Se l'operazione avviene con
  # successo, il browser verrà redirezionato alla lista di uscite.
  def destroy
    @outing.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Outing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_outing
      @outing = Outing.find(params[:id])
    end

    # Metodo che imposta i parametri richiesti e ammessi durante la creazione o la modifica
    # di un'istanza di Outing.
    def outing_params
      params.require(:outing).permit(:day, :location, :time)
    end
end
