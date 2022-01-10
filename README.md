# README

Ruby version
   * ruby-3.0.1

Passos necessários para rodar o projeto localmente:

* Clonar o repositório atraves do comando 'git clone' ou baixar a pasta zipada direto para seu computador
* Ir em /config/database.example.yml e mudar o nome para "database.yml" e preencher as informaçoes pedidas como usuario e senha do seu banco de dados local.
* Executar o comando 'bundle install' para instalar as gems e dependencias
* Executar os comandos 'rake db:create' e depois 'rake db:migrate'
* Executar o comando 'rails server' para inicializar o servidor
* Acessar o caminho http://localhost:3000/api/v1/imc para ter acesso a listagem de clientes da api

Para testes

* Abrir o console e dentro da pasta do projeto executar o comando 'rspec' para executar os testes
