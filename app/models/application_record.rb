#
# Classe astratta ereditata da ciascuna classe modello.
#
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
