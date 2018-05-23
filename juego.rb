class Juego

   def initialize
     @array=[]
     @i=Hash.new(0)
     @count=0
   end

    def read_txt(file)
      if File.exist?(file)
           arr = IO.readlines(file)
           arr.each do |key|
           question, answer = key.chomp.split('-')
           hash={ :question => question, :answer => answer, :boolean => false }
           @array<<hash
         end
      else
        return "El archivo no existe"
      end
    end

    def length_array
      @array.length
    end

    def print_file(file)
      file=read_txt(file)
      puts file
    end

    def choose_file(file)
      file=read_txt(file)
    end

  def print_question
    puts choose_question
  end

  def print_array
    puts @array
  end

  def print_choose_array(num)
    puts @array[num]
  end

  def choose_question
    # fals añadir acá que la pregunta que seleccione sea boolean:false
    @array.shuffle
    @i=@array.sample
    if(@i[:boolean]==true)
        choose_question()
    else
      return @i
    end
  end


  def available_question()
    @i=choose_question()
    while (@i[:boolean]==false) do
      puts @i[:question]
      usuario=gets.chomp
      if (@i[:answer]==usuario)
        puts "Correcto!!!, continua con la siguiente:"
        @i[:boolean]=true

         # @count+=1
         # puts "contador #{@count}"
      else
          puts "Incorrecto, intentalo de nuevo:"
          # if (tam<=@count)
          #   puts"¡¡¡GANASTE, HASTA LA PRÓXIMA!!!"
          # end
      end

    end
    # available_question()
  end

  # end class Juego
end



class Interface < Juego

  def show_menu
    system("clear")
    puts "============================================================================"
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
    puts "=====================   Bienvenido al Juego del Ruby   ====================="
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
    puts "============================================================================"
    puts "        En este juego podras divertite un poco, es una simple trivia        "
    puts "############################################################################"
    puts "----------------------------------------------------------------------------"
    puts "Si quieres jugar presiona 'Y' sino quieres jugar presiona cualquier tecla"
    star=gets.chomp.upcase
    if(star=="Y")
        go_play
    else
      puts "HASTA LA PRÓXIMA ;)"
    end
  end

  def go_play
    system("clear")
    choose_file("file.txt")
    tam=length_array
    tam.times do
      available_question()
    end
  end

end

p2=Interface.new
p2.show_menu
# if(log=="Y")
#     p2.go_play
# else
#   puts "HASTA LA PRÓXIMA ;)"
# end

# p1.print_choose_array(3)
# p1.print_question
