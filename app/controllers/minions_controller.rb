class MinionsController < ApplicationController

    before_action :set_minion, only: [:edit, :update, :destroy]

    def index
        @minions = Minion.order(nome: :asc)
        @minion_com_desconto = Minion.order(:preco).limit 2
    end

    def new
        @minion = Minion.new
    end

    def edit
        renderiza :edit
    end

    def update
        if @minion.update minion_params
          flash[:notice] = "Minion atualizado com sucesso!"
          redirect_to root_url
       else    
         renderiza :edit
       end

    end

    def create
        @minion = Minion.new minion_params
        if @minion.save
            flash[:notice] = "Minion cadastrado com sucesso!"
            redirect_to root_url
        else
            renderiza :new
        end
    end

    def destroy
        @minion.destroy
        flash[:notice] = "Minion removido com sucesso!"
        redirect_to root_url
    end

    def envio_email
        @minion = Minion.find(params[:id])
        EmailReservaMailer.email_reserva(@minion).deliver
        flash[:notice] = "Minion reservado com sucesso! Favor checar sua caixa de entrada de e-mail"
        redirect_to root_url
    end

    def busca
        @nome = params[:nome]
        @minions = Minion.where("lower(nome) like ?", "%#{@nome.downcase}%")
    end

    private

    def minion_params 
        params.require(:minion).permit(:nome, :descricao, :preco, :quantidade)
    end

    def set_minion
        @minion = Minion.find(params[:id])
    end

    def renderiza(view)
        render view
    end

end
