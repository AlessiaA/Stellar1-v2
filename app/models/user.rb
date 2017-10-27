# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  email                   :string           default(""), not null
#  encrypted_password      :string           default(""), not null
#  reset_password_token    :string
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  sign_in_count           :integer          default(0), not null
#  current_sign_in_at      :datetime
#  last_sign_in_at         :datetime
#  current_sign_in_ip      :inet
#  last_sign_in_ip         :inet
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  role                    :integer
#  name                    :string
#  surname                 :string
#  birth                   :date
#  subscription_expiration :date
#

#
# Classe modello per la tabella "users".
#
class User < ApplicationRecord

  # relazioni
  has_many :observative_sessions, dependent: :destroy
  has_many :observations, dependent: :destroy

  # Include i moduli di default usati dalla libreria "Devise", che offre
  # funzionalità di autenticazione agli utenti.
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: %i(user admin)

  before_create :set_default_role

  # verifica la presenza dei campi specificati.
  validates_presence_of :name, on: :create
  validates_presence_of :surname, on: :create
  validates_presence_of :birth, on: :create
  validates_presence_of :subscription_expiration, on: :create

  # Metodo che verifica la correttezza del campo "role".
  def has_role? role
    self.role == role.to_s
  end

  private

  # Metodo che assegna ad un utente il ruolo di default.
  def set_default_role
    self.role = :user
  end

end
