def suma(numero)
  suma = 0
  (0..numero).each do |n|
    suma +=n
  end
  suma
end
puts "La suma de 10 es #{suma 10}"

# Otra forma de escribirlo
def suma(numero)
  (0..numero).reduce '+'
end
puts "La suma de 10 deberia de seguir siendo #{suma 10}"

def suma_de_sus_cuadrados(numero)
  suma = 0
  (1..numero).each do |n|
    suma += n**2
  end
  suma
end
puts "La suma de los cuadrados de 3 es #{suma_de_sus_cuadrados 3}"

# Otra forma de escribirlo..
def suma_de_sus_cuadrados(numero)
  (0..numero).map { |n| n**2 }.reduce '+'
end
puts "La suma de los cuadrados de 3 es #{suma_de_sus_cuadrados 3}"

def quien_es(nombre)
  case nombre
  when "Jesus Alejandro", "Jesus"
    "Pues el Jesus!!"
  when "Carmen", "Carmen Salinas"
    "Es Carmelita!"
  when "Guadalupe"
    "Guadalupe la frutera"
  else
    "No se :S :S :S"
  end
end

puts quien_es 'Jesus'
puts quien_es 'Carmen'
puts quien_es 'Guadalupe'
puts quien_es 'Edgar'

reemplazos = { 'Lupe' => 'Jesus Alejandro',
               'estas?' => 'andamos?',
               'idea' => 'un poco de popo',
               'Besos' => 'Muerte' }

carta = ''
File.read('carta.txt').split(' ').each do |word|
  if reemplazos[word]
    carta << reemplazos[word]
  else
    carta << word
  end
  carta += " "
end

puts carta
