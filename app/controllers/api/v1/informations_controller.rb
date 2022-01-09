module Api
	module V1
		class InformationsController < ApplicationController

            # GET localhost:3000/api/v1/imc

            # Lista todos os dados salvos
            def index
                information = Information.all;
				render json: {data: information}, status: :ok
			end

            # POST localhost:3000/api/v1/imc

            # Recebe um json com peso(weight) e altura(height) e retorna o imc em outro json
            # Apos esse processo, salva as informações no banco para uma possivel futura consulta.

            def create
               
                height = params[:information][:height]
                weight = params[:information][:weight]
                calc_imc(height,weight)

                render json: { imc: @imc , classification: @condition, obesity: @obesity}, status: :created

                information = Information.new(information_params)
                information.update(imc: @imc, classification: @condition, obesity: @obesity)
                information.save
            end

            
            private
            def calc_imc(height, weight)
                weight = weight.to_i
                height = height.to_f

                @imc = weight / (height * height)
                @imc = @imc.round(2)

                if @imc < 18.5
                    @condition = "Magreza"
                    @obesity = "0"
                elsif @imc.between?(18.5, 24.9)
                    @condition = "Normal"
                    @obesity = "0"
                elsif @imc.between?(25, 29.9)
                    @condition = "Sobrepeso"
                    @obesity = "I"
                elsif @imc.between?(30, 39.9)
                    @condition = "Obesidade"
                    @obesity = "II"
                elsif @imc > 40
                    @condition = "Obesidade Grave"
                    @obesity = "III"
                end

            end

            def information_params
                params.permit(:height, :weight)
            end

		end
	end
end