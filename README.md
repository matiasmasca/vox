[![Beerpay](http://test.beerpay.io/matiasmasca/vox/badge.svg?style=flat-square)](http://test.beerpay.io/matiasmasca/vox)
***vox***
===

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/matiasmasca/vox?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
Repositorio para la edición comunitaria (software libre) de VOX, un sistema gestor de contenidos para procesos de selección; desarrollado con Ruby on Rails.

El alcance del proyecto es poder crear y gestionar un proceso de selección completo (creación, apertura, votación, cierre) con sus usuarios asociados: organizador y jurado. Administrando un padrón y teniendo acceso al escrutinio de los votos.

**El Origen.**
En esencia es un experimento de aplicación y practica de los conceptos de BDD y TDD utilizando el lenguaje de programación Ruby y el framework Ruby on Rails.
Algunos de los archivos no siguen exactamente las buenas practicas, en algunos casos por desconocimiento y en otros como parte del experimento; ya que es la primera experiencia con Rails y la metodología seguida.
Como es parte la parte practica de mi "trabajo final de carrera". No se pueden aceptar contribuciones mayores hasta no completar un proceso de evaluación en la universidad a la que asisto; sin embargo toda contribución (sugerencias de cambio), consejo, critica constructiva, consultas son bienvenidas.

**Herramientas**.
  - Para las Historias de Usuario se utilizará: **PivotalTracker**
  - Para BDD, se utiliza: **Cucumber**, **Capybara**.
  - Para TDD, se utiliza: **RSpec**.
  - Para probar continuamente, se utiliza: **Guard**
  - Para la Integración Continua: **Travis-ci**
  - Para el deploy, el servicio de hosting: **Heroku**

**Servicios Externos.**
-----------------------
VOX esta siendo integrado con servicios externos para mejorar la calidad de su código. A continuación puede ver una lista de ellos.

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

<<<<<<< HEAD
Gitter - Chat:
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/matiasmasca/vox?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
=======
Heroku App - Demo:
    [![Heroku](http://heroku-badge.herokuapp.com/?app=tfa-vox&root=/paginas/home.html)]
>>>>>>> InformeDefinitivo

**Notas Técnicas**
===========

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
  * COVERALL
  * DATABASE_NAME
  * DATABASE_USER
  * DATABASE_PASS
  * DATABASE_URL
  * FB_App_id
  * FB_App_secret
  * HEROKU_POSTGRESQL_VIOLET_URL
  * loaderio
  * SECRET_KEY_BASE para el secret token
  * TW_Consumer_key
  * TW_Consumer_secret
 - cambiar los .yml de Travis y de Coveralls.



   Contributing
   ============

     1. Fork it
     2. Create your feature branch (`git checkout -b my-new-feature`)
     3. Commit your changes (`git commit -am 'Add some feature'`)
     4. Push to the branch (`git push origin my-new-feature`)
     5. Create new Pull Request

     e=======

     Copyright (c) 2015  Matias Mascazzini

     MIT License [![License](http://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](http://opensource.org/licenses/MIT)

     Permission is hereby granted, free of charge, to any person obtaining
     a copy of this software and associated documentation files (the
     "Software"), to deal in the Software without restriction, including
     without limitation the rights to use, copy, modify, merge, publish,
     distribute, sublicense, and/or sell copies of the Software, and to
     permit persons to whom the Software is furnished to do so, subject to
     the following conditions:

     The above copyright notice and this permission notice shall be
     included in all copies or substantial portions of the Software.

     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
     LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
     OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
     WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

     ...
     pepepepe
