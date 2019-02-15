class EmailReservaMailer < ApplicationMailer
    def email_reserva(minion)
        @minion = minion
        mail(to: "rayssa@inventosdigitais.com.br", :cc => "daviddener22@gmail.com",
         subject: "Reserva de Minion")
    end
end

