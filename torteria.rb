$tiempo_horno = 0

class Torta
  attr_reader :tam #tamaño
  attr_reader :tipo_torta
  attr_reader :tiempo_coccion
  attr_reader :coccion

  def initialize(tipo_torta, tam)
    @tam = tam
    @tipo_torta = tipo_torta
    @tiempo_coccion = 0
    @coccion = ""
  end#mtd initialize

  def to_s
    "soy #{self} #{tipo_torta} #{@tam}"
  end#mtd to_s

  def tiempo_coccion
    case @tipo_torta
      when "rusa"             then @tiempo_coccion = 8
      when "argentina"        then @tiempo_coccion = 7
      when "hawaiana"         then @tiempo_coccion = 4
      when "cubana"           then @tiempo_coccion = 3
      when "milanesa"         then @tiempo_coccion = 5
      else
        "Esa torta no está en el menú"
    end
  end#mtd tiempo_coccion

  def coccion
    tiempo_coccion
    if $tiempo_horno < @tiempo_coccion - 1
      @coccion = "Torta #{tipo_torta} cruda"
    elsif $tiempo_horno > @tiempo_coccion
      @coccion = "Torta #{tipo_torta} se quemó"
    elsif $tiempo_horno == @tiempo_coccion - 1
      @coccion = "Torta #{tipo_torta} casi lista"
    else
      @coccion = "Torta #{tipo_torta} lista!"
    end
  end#mtd torta_coccion
      

end

class Horno

  attr_reader :capacidad

  def initialize
    @capacidad = 0
  end

  def fill
    @capacidad += 1
  end

  def fill?
    if @capacidad < 1
      false
    else
      true
    end
  end

end#class Horno


class Charola
  attr_reader :capacidad

  def initialize
    @capacidad = 0.0
  end

  def fill(tam)
      if @capacidad < 12
          if tam == "normal"
            @capacidad += 2
          elsif tam == "mitad"
            @capacidad += 1
          else
            @capacidad += 3 #tam == "grande"
          end
      end
  end#mtd fill

  def fill?
    if @capacidad >= 12
      true 
    else
      false
    end
  end#mtd fill?

end#class charola

horno = Horno.new
charola = Charola.new
quemadas = []
listas = []
tortas = []
menu = %w( Rusa Argentina Hawaiana Cubana Milanesa)
lineWidth = 60
puts "Menú del día".center lineWidth

until charola.fill?
    puts "\t*Rusa  *Argentina  *Hawaiana  *Cubana  *Milanesa"
    tipo_torta = gets.chomp.downcase

    puts "  Selecciona un tamaño"
    puts "\t Mitad / Normal / Grande "
    t = gets.chomp.downcase

    tortas << Torta.new(tipo_torta, t)
    charola.fill(t)
end

until horno.fill?
  $tiempo_horno = rand(9)
  horno.fill
end

tortas.each do |torta|
  p torta.coccion
end







  






        
