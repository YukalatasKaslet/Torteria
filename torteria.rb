$tiempo_horno = 0

class Torta
  attr_reader :tam #tamaño
  attr_reader :tipo_torta
  attr_reader :tiempo_coccion

  def initialize(tam, tipo_torta)
    @tam = tam
    @tipo_torta = tipo_torta
    @tiempo_coccion = 0
  end#mtd initialize

  def to_s
    "soy #{self} #{tipo_torta} #{@tam}"
  end#mtd to_s

  def tiempo_coccion
    case @tipo_torta
      when "Rusa"             then @tiempo_coccion = 8
      when "Argentina"        then @tiempo_coccion = 7
      when "Hawaiana"         then @tiempo_coccion = 4
      when "Cubana"           then @tiempo_coccion = 3
      when "Carne Al pastor"  then @tiempo_coccion = 5
      else
        "Esa torta no está en el menú"
    end
  end#mtd tiempo_coccion

  def torta_coccion
    tiempo_coccion
    if $tiempo_horno < @tiempo_coccion - 1
      "Torta #{tipo_torta} cruda"
    elsif $tiempo_horno > @tiempo_coccion
      "Torta #{tipo_torta} se quemó"
    elsif $tiempo_horno == @tiempo_coccion - 1
      "Torta #{tipo_torta} casi lista"
    else
      "Torta #{tipo_torta} lista!"
    end
  end#mtd torta_coccion
      

end


class Horno

  attr_reader :temperatura
  attr_reader :capacidad

  def initialize
    @temperatura = 120
    @capacidad = 2
  end

end#class Horno

