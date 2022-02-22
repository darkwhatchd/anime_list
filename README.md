# README

Anime List é um WebApp desenvolvido com Ruby on Rails e BulmaCSS.

Tem como funcionalidade principal, favoritar e seguir animes registrados, uma espécie de "assistir mais tarde" ou lista.

Possui um sistema de Administrador, que foi totalmente separado da parte dos usuários comuns.

* Rotas separadas por namespace/scope

* Controllers separados por módulos

* Views separadas por pastas, seguindo os controllers

O administrador tem função de gerenciar animes e usuários.

O usuário comum tem função de ver os animes, seguir e favoritar animes.

Dependências

Versão do Ruby utilizada:

* ruby "3.0.1"

Versão do Rails:

* Rails: "~> 6.1.4", ">= 6.1.4.6"

Versão do BulmaCSS:

* Bulma: "^0.9.3"

Ícones:

* FontAwesome-sass ~> 5.15.1

Paginação:

* Kaminari

Autenticação:

* gem Devise

Autorização:

* gem Pundit

Database:

* Postgresql

Testes:

* Feitos com RSpec 5.0, FactoryBot, Shoulda Matchers, Faker.

JQuery foi instalado para ser utilizado em algumas partes do front end:
* jquery: "^3.6.0"

gem "image_processing", "~> 1.2" é requerida para renderizar corretamente imagens do ActionText e ActiveStorage.

Services:

* FollowFavorite: service criado para seguir um anime que foi favoritado.

* UnfollowFavorite: service criado para quando um anime favorito deixar de ser seguido, ele automaticamente não será mais favorito.

Desenvolvido com TDD (Test-driven development). Foram feitos testes de model e testes de requests com TDD.

TDD é a sigla para Test Driven Development, que em português significa Desenvolvimento Orientado por Testes. Esse é um método de desenvolvimento muito comum atualmente.

Ele se baseia na aplicação de pequenos ciclos de repetições. Em cada um deles, um teste é aplicado. 

O objetivo é desenvolver uma função que permita que esse teste tenha um resultado positivo. Ou seja, a função está pronta para ser implementada.

Quais as vantagens de usar o TDD no dia a dia de desenvolvimento? 

  * é possível focar em problemas específicos de desenvolvimento; 

  * Crie códigos mais limpos e simples, e que também são fáceis de refatorar;

  * Mais facilidade para corrigir bugs por meio dos ciclos de desenvolvimento;

  * Flexibilidade no código; 

  * Mais produtividade;

  * Foco na resolução de problemas; 

  * Índice menor de retrabalho 
