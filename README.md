vox
===

Repositorio para la edición comunitaria (software libre) de Vox, un sistema gestor de contenidos para procesos de selección.

El alcance del proyecto es poder crear y gestionar un proceso completo (creación, apertura, votación, cierre) con sus usuarios asociados.


En escencia es un experimento de aplicación y practica de los conceptos de BDD y TDD utilizando el lenguaje de programción Ruby y el framework Ruby on Rails.
Algunos de los archivos no siguen exactamente las buenas practicas, en algunos casos por desconocimiento y en otros como parte del experimento.
No se pueden aceptar contribuciones mayores hasta no completar un proceso de evaluación en la universidad a la que asisto; sin embargo toda contribución (sugerencias de cambio), consejo, critica constructiva, consultas son bienvenidas. 

  - Para las Historias de Usuario se ulizará: PivotalTracker
  - Para BDD, se utiliza: Cucumber, Capybara.
  - Para TDD, se utiliza: RSpec.


Calidad del Código, seǵun CodeClimate
    [![Code Climate](https://codeclimate.com/github/matiasmasca/vox.png)](https://codeclimate.com/github/matiasmasca/vox)

Covertura de código con pruebas, según Coveralls.io
    [![Coverage Status](https://coveralls.io/repos/matiasmasca/vox/badge.png)](https://coveralls.io/r/matiasmasca/vox)

Integración Continua: con Travis-ci.org
    [![Build Status](https://travis-ci.org/matiasmasca/vox.svg?branch=master)](https://travis-ci.org/matiasmasca/vox)

Dependency Status:
    [![Dependency Status](https://gemnasium.com/matiasmasca/vox.svg)](https://gemnasium.com/matiasmasca/vox)

CodeReview - TODOs:
[![PullReview stats](https://www.pullreview.com/github/matiasmasca/vox/badges/master.svg?)](https://www.pullreview.com/github/matiasmasca/vox/reviews/master)

* Ruby version:
    ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-linux]

* Rails version:
    rails 4.0.1

* System dependencies:
    mirar el archivo gemfile

* Configuration:
    Nada especial por ahora.

* Instalación para Dev:
    bundler install

* Database creation:
    rake db:migrate

* Database initialization:
    rake db:seed 
    rake db:test:prepare

* How to run the test suite:
    cucumber
    cucumber --profile wip (para trabajar sobre algo en particular)
    rspec

* Services (job queues, cache servers, search engines, etc.):
    nada especial.

* Deployment instructions:
  - cambiar el token ejecutando: rake secret
  - Crear las variables de entorno: 
    * DATABASE_NAME
    * DATABASE_USER
    * DATABASE_PASS
    * SECRET_KEY_BASE para el secret token
 - cambiar los .yml de Travis y de Coveralls.


