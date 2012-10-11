# Clases en Ruby
# - Inicializador/Constructor (opcional)
# - Propiedades (variables de instancia)
# - Metodos de clase
# - Metodos de instancia

def nombre_del_metodo(argumentos)  # Definicion de un metodo.
end

class NombreDeLaClase              # Definicion de una clase, PascalCase por
                                   # convencion.
  def initialize(argumentos = nil) # Definicion del constructor, en cualquier
                                   # metodo los argumentos son opcionales si se
  end                              # le pone un valor por defecto.

  attr_accessor :propiedad, :pr2   # Asi definimos propiedades que tendran las
                                   # instancias de la clase. Pueden llamarse
                                   # usando: self.propiedad o @propiedad.

  def self.hola                    # Este es un metodo de clase
  end

  def adios                        # Y este uno de instancia
  end
end

class Usuario
  attr_accessor :nombre, :edad, :sexo

  def initialize(options = {}) # Valor por defecto, Hash vacio
    @nombre = options[:nombre]
    @edad   = options[:edad]
    @sexo   = options[:sexo]
    @@usuarios ||= []          # Variable de clase, la inicializamos con un
                               # arreglo vacio si no esta definida aun.
    @@usuarios << self
  end

  def self.buscar_usuario(nombre) # Definimos un metodo de clase que buscara
                                  # a los usuarios por nombre.
    @@usuarios.find { |usuario| usuario.nombre == nombre } # Ver metodo Array#find
  end

  def self.mujer(options = {}) # Metodo de clase, que inicializara a un usuario
    options[:sexo] = "Mujer"   # con sexo 'Mujer'.
    new options
  end

  def self.hombre(options = {}) # Metodo de clase, que inicializara a un usuario
    options[:sexo] = "Hombre"   # con sexo 'Hombre'.
    new options
  end

  def saludar # Metodo de instancia
    "Hola, me llamo #{@nombre} " +
      "Y soy #{self.sexo}"
  end

  def esta_disponible? # Los nombres de los metodos pueden llevar signo de
    rand(2) == 1       # admiracion o interrogacion al final.
  end
end

class Nino < Usuario # Clase Nino, hereda de Usuario (Usuario es su clase padre)
  attr_accessor :le_gusta_barny
  def initialize(opciones, le_gusta_barny)
    self.le_gusta_barny = le_gusta_barny
    opciones[:edad] %= 12 # Hacemos que edad siempre sea menor a 12.
    super(opciones) # Llamamos al metodo initialize de Usuario (super), y le
                    # pasamos como argumento unicamente las opciones.
  end

  def saludar       # Sobreescribimos el metodo saludar de Usuario.
    "HOLA CUATES SOY #{@nombre}, y #{le_gusta_barny ? 'si' : 'no'} " +
      "me gusta Barny"
  end

  def esta_disponible?
    raise "No le preguntes a un nino " + # Asi es como se levanta una excepcion
      "si esta disponible!!"             # o un error.

  end
end

puts "Creamos una instancia de un Usuario y la guardamos en una variable."
jesus_alejandro = Usuario.hombre(:nombre => "Jesus Alejandro", :edad => 13)

puts "Creamos mas instancias, pero no las guardamos."
Usuario.mujer(:nombre => "Chuchita", :edad => 23)
Usuario.mujer(:nombre => "Paquita", :edad => 33)

puts "Hacemos que Jesus Alejandro nos salude."
puts jesus_alejandro.saludar

puts "Buscamos a Chuchita entre los usuarios."
puts Usuario.buscar_usuario("Chuchita").inspect

puts "Buscamos a Fruti Lupi, no la deberia de encontrar."
puts Usuario.buscar_usuario("Fruti Lupi").inspect

puts "Creamos un nino nuevo, su edad sera menor a 40."
nino = Nino.new({:nombre => "Fito Paez", :edad => 40, :sexo => "hombre"}, false)
puts nino.inspect
puts nino.saludar

puts "Le preguntamos a Jesus Alejandro si esta disponible"
puts jesus_alejandro.esta_disponible?

puts "Le preguntamos al nino si esta dispnible"
puts nino.esta_disponible?

class Animal
  def emitir_sonido(decibles, sexo, duracion, condon)
  end
end

class Elefante < Animal
  DECIBELES = 140
  DURACION = 60
  def emitir_sonido(sexo, condon)
    super(DECIBELES, sexo, DURACION, condon)
  end
end
