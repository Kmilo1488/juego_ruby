class Juego

  attr_accessor :questions

  def initialize()

    @questions = Hash.new
    cont = 1
    is_definition = true
    question = ''
    answer = ''

    File.open('preguntas.txt', 'r') do |f1|
      while linea = f1.gets

        if cont % 2 == 0
          is_definition = false
        else
          is_definition = true
        end

        if is_definition
          question = linea
        else
          answer = linea.chomp
        end

        if answer != ''
          @questions[question] = answer
        end

        answer = ''
        cont += 1

      end
    end

  end

end

class Reto

  def play

    number_attempts = 0
    number_questions = 0
    puts "=========================================JUEGO RUBY========================================="
    puts ""
    puts "BIenvenido, para jugar solo debes ingresar la respuesta de cada definicion listo, en marcha."

    sur = Juego.new

    sur.questions.each do |key, value|

      puts "";

      number_attempts += 1
      number_questions += 1

      puts "Pregunta: #{key}"
      print "Respuesta: "
      STDOUT.flush
      answer =  gets.chomp
      answer = answer.downcase

      while answer != value.downcase do
        puts "";
        puts 'Incorrecto!, Trata de nuevo'
        puts "Pregunta: #{key}"
        print "Respuesta: "
        STDOUT.flush
        answer = gets.chomp
        answer = answer.downcase
        number_attempts += 1;
      end

      puts 'Correcto!'

    end

    puts "";
    puts "Haz finalizado, total de intentos #{number_attempts}, preguntas #{number_questions}."
    puts ""
    puts "=========================================JUEGO RUBY========================================="

  end

end

game = Reto.new
game.play
