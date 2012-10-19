# 5chan

## Correrlo

En Gemfile, agrgue el gem "shotgun". Lo que hace es que no necesitamos
cerrar y volver a correr la aplicacion para ver los cambios. La unica
diferencia es que corre en el puerto 9393.

Despues de modificar el Gemfile corremos de nuevo `bundle install`.

Para iniciar shotgun, simplemente con el comando `shotgun`.

Shotgun va a revisar el archivo `config.ru` que tiene la referencia para iniciar
el servicio.

## Vistas

Al correrlo desde afuera de lib (por el config.ru), Sinatra va a buscar las
vistas afuera, por eso movi el directorio.

## Clases Video, User y Comment

Los van a crear adentro de lib, y luego descomentar los requires que estan en
`lib/5chan.rb`.

La referencia de DataMapper, la pueden encontrar en: http://datamapper.org/getting-started.html

May the force be with you
