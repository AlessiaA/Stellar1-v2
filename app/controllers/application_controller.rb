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
    # Esegue la ricerca.
	if params[:order] == nil
    params[:order] = 'created_at DESC'
	end
    @q = ObservativeSession.ransack(user_id_eq: current_user.id)
    @observative_sessions = @q.result.includes(:location).order(params[:order]).paginate(page: params[:page]) if params[:q].present?
    @observative_sessions = @q.result.includes(:location).order(params[:order]).paginate(page: params[:page]) unless params[:q].present?
    @observative_session = ObservativeSession.new
	
	@r = Outing.ransack(params[:r])
	@outings = @r.result.order('day DESC').paginate(page: params[:page]) if params[:r].present?
    @outings = Outing.order('day DESC').paginate(page: params[:page]) unless params[:r].present?
	@outing = Outing.new
	@locations = Location.order(:name).all
	# visualizza la lista degli utenti iscritti.
    render 'observative_sessions/index'
  end

  # Metodo che visualizza la pagina iniziale degli utenti ordinari.
  def user_index
	if params[:order] == nil
    params[:order] = 'created_at DESC'
	end
	@q = ObservativeSession.ransack(user_id_eq: current_user.id)
    @observative_sessions = @q.result.includes(:location).order(params[:order]).paginate(page: params[:page]) if params[:q].present?
    @observative_sessions = @q.result.includes(:location).order(params[:order]).paginate(page: params[:page]) unless params[:q].present?
	@observative_session = ObservativeSession.new
    
	@r = Outing.ransack(params[:q])
	@outings = @r.result.order('day DESC').paginate(page: params[:page]) if params[:q].present?
    @outings = Outing.order('day DESC').paginate(page: params[:page]) unless params[:q].present?
	@outing = Outing.new
	@locations = Location.order(:name).all
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
