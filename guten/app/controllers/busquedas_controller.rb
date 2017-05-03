class BusquedasController < ApplicationController
  def indice
  	@documentos = []
    if params[:busque].present?
      @documentos = Gutenberg.where(word: params[:busque]).order_by(numero: :des).limit(20)
    end
  end
end
