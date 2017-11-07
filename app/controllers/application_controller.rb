#
# Classe ereditata da tutti i controller.
#
class ApplicationController < ActionController::Base

  layout :set_layout
  protect_from_forgery with: :exception
  # Prima di poter accedere alle funzionalità della pagina, è richiesta
  # l'autenticazione dell'utente.
  before_action :authenticate_user!

  # Questo metodo invoca i metodi richiesti per la visualizzazione della
  # pagina iniziale, dipendentemente dal ruolo dell'utente.
  def index
    if current_user.has_role? :admin
      admin_index
    else
      user_index
    end
  end

  private

  # Metodo che visualizza la pagina iniziale degli utenti amministratori.
  def admin_index
    # Esegue la ricerca degli utenti.
    @q = ObservativeSession.ransack(params[:q])
    @observative_sessions = @q.result.order(params[:order]).paginate(page: params[:page]) if params[:q].present?
    @observative_sessions = ObservativeSession.order(params[:order]).paginate(page: params[:page]) unless params[:q].present?
    @observative_session = ObservativeSession.new
	
	@r = Outing.ransack(params[:q])
	@outings = @r.result.ransack(params[:q]).paginate(page: params[:page]) if params[:q].present?
    @outings = Outing.order('day DESC').paginate(page: params[:page]) unless params[:q].present?
	@outing = Outing.new
	# visualizza la lista degli utenti iscritti.
    render 'observative_sessions/index'
  end

  # Metodo che visualizza la pagina iniziale degli utenti ordinari.
  def user_index
	@q = ObservativeSession.ransack(params[:q])
    @observative_sessions = @q.result.order(params[:order]).paginate(page: params[:page]) if params[:q].present?
    @observative_sessions = ObservativeSession.order(params[:orser]).paginate(page: params[:page]) unless params[:q].present?
    @observative_session = ObservativeSession.new
    
	@r=Outing.ransack(params[:r])
	@outings = @r.result.order(params[:order]).paginate(page: params[:page]) if params[:r].present?
    @outings = Outing(params[:order]).paginate(page: params[:page]) unless params[:r].present?
	# visualizza la pagina iniziale degli utenti ordinari.
	render 'observative_sessions/index'
  end

  # Metodo per impostare il layout della pagina, sulla base
  # del ruolo dell'utente.
  def set_layout
    if current_user
      case current_user.role
      when "admin"
        "admin"
      when "user"
        "user"
      end
    else
      "default"
    end
  end

end
