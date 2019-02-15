class EmailReservaMailer < ApplicationMailer
    def email_reserva(minion)
        @minion = minion
        mail(to: "rayssa@inventosdigitais.com.br", subject: "Reserva de Minion")
    end
end

