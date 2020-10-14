# frozen_string_literal: true

module Interactors
  class Base
    include Interactor
    include Interactor::Contracts
  end
end
