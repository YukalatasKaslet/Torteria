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
      when "Rusa"             then @tiempo_coccion = 1
      when "Argentina"        then @tiempo_coccion = 2
      when "Hawaiana"         then @tiempo_coccion = 4
      when "Cubana"           then @tiempo_coccion = 3
      when "Carne Al pastor"  then @tiempo_coccion = 5
      else
        "Esa torta no está en el menú"
    end
  end#mtd tiempo_coccion

end

      