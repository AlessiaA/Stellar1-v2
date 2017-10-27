#
# Classe controller che implementa le funzionalità CRUD per la classe model "Eyepiece".
#
class EyepiecesController < ApplicationController
  before_action :set_eyepiece, only: [:show, :edit, :update, :destroy]

  # Metodo che recupera gli oculari (eventualmente mediante ricerca), 
  # li ordina, attua una paginazione degli stessi ed in seguito
  # li visualizza.
  def index
    @q = Eyepiece.ransack(params[:q])
    @eyepieces = @q.result.order(params[:order]).paginate(page: params[:page]) if params[:q].present?
    @eyepieces = Eyepiece.order(params[:order]).paginate(page: params[:page]) unless params[:q].present?
    @eyepiece = Eyepiece.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def show
  end

  # Metodo che crea un'istanza di Eyepiece, la quale verrà 
  # passata alla vista corrispondente all'URL "/eyepieces/1/edit".
  def new
    @eyepiece = Eyepiece.new
  end

  # Metodo ereditato dalla classe ApplicationController.
  def edit
  end

  # Questo metodo crea un'istanza di Eyepiece e la salva nel database.
  # Se l'operazione si conclude con successo, avverrà una redirezione alla pagina
  # che presenta i dettagli dello strumento creato. In caso contrario, verrà
  # visualizzato un messaggio d'errore.
  def create
    @eyepiece = Eyepiece.new(eyepiece_params)

    respond_to do |format|
      if @eyepiece.save
        format.html { redirect_to @eyepiece, notice: 'Eyepiece was successfully created.' }
        format.json { render :show, status: :created, location: @eyepiece }
      else
        format.html { render :new }
        format.json { render json: @eyepiece.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che aggiorna un'istanza di Eyepiece. Se l'operazione avviene con successo,
  # avverrà una redirezione alla pagina che visualizza i dettagli dello strumento aggiornato.
  # In caso contrario, verrà visualizzato un messaggio d'errore.
  def update
    respond_to do |format|
      if @eyepiece.update(eyepiece_params)
        format.html { redirect_to @eyepiece, notice: 'Eyepiece was successfully updated.' }
        format.json { render :show, status: :ok, location: @eyepiece }
      else
        format.html { render :edit }
        format.json { render json: @eyepiece.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo che elimina un'istanza di Eyepiece. Se l'operazione avviene con
  # successo, il browser verrà redirezionato alla lista di oculari.
  def destroy
    @eyepiece.destroy
    respond_to do |format|
      format.html { redirect_to eyepieces_url, notice: 'Eyepiece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_eyepiece
      @eyepiece = Eyepiece.find(params[:id])
    end

    # Metodo che imposta i parametri richiesti e ammessi durante la creazione o la modifica
    # di un'istanza di Eyepiece.
    def eyepiece_params
      params.require(:eyepiece).permit(:name, :brand, :focal_length, :ocular, :apparent_fov, :size, :description, :notes)
    end
end
