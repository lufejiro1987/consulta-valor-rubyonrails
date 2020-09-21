class ConsultasController < ApplicationController

  def uf_value
    cliente = request.headers['X-CLIENTE']
    date = params[:date].to_date rescue nil
    if !date.nil?
      unless cliente.blank?
        Query.create(client: cliente, uf_date: date)
      end
      uf_value = UfValue.where(date: date).first rescue nil
      if !uf_value.nil?
        respond_to do |format|
          format.json { render json: { date: uf_value.date, value: uf_value.value } }
        end
      else
        respond_to do |format|
          format.json { render json: { error: 'No se encuentra la fecha' } }
        end
      end
    else
      respond_to do |format|
        format.json { render json: { error: 'Debe proporcionar una fecha' } }
      end
    end
  end

  def client_stats
    cliente = params[:client]
    cantidad_queries = Query.where(client: cliente).count
    respond_to do |format|
      format.json { render json: { client: cliente, queries: cantidad_queries } }
    end
  end

end
