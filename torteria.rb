$tiempo_horno = 0

class Torta
  attr_reader :tam #tamaño
  attr_reader :tipo_torta
  attr_reader :tiempo_coccion
  attr_reader :estatus

  def initialize(tipo_torta, tam, tiempo_coccion)
    @tam = tam
    @tipo_torta = tipo_torta
    @tiempo_coccion = tiempo_coccion
    @status = ""

  end#mtd initialize

  def to_s
    "soy #{self} #{tipo_torta} #{@tam}"
  end#mtd to_s

  # def tiempo_coccion
  #   case @tipo_torta
  #     when "rusa"             then @tiempo_coccion = 8
  #     when "argentina"        then @tiempo_coccion = 7
  #     when "hawaiana"         then @tiempo_coccion = 4
  #     when "cubana"           then @tiempo_coccion = 3
  #     when "milanesa"         then @tiempo_coccion = 5
  #     else
  #       "Esa torta no está en el menú"
  #   end
  # end#mtd tiempo_coccion

  def coccion
    if $tiempo_horno < @tiempo_coccion - 1
       "Torta #{tipo_torta} cruda"
       @estatus = "cruda"
    elsif $tiempo_horno > @tiempo_coccion
      "Torta #{tipo_torta} se quemó"
      @estatus = "quemada"
    elsif $tiempo_horno == @tiempo_coccion - 1
      "Torta #{tipo_torta} casi lista"
      @estatus = "casi lista"
    else
      "Torta #{tipo_torta} lista!"
      @estatus = "lista"
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
    if @capacidad <= 3
      false
    else
      true
    end
  end

end#class Horno


class Charola
  attr_reader :capacidad

  def initialize
    @capacidad = 0
  end

  def clean
    @capacidad = 0
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
quemadas = 0
listas = 0
crudas = 0
casi_listas = 0
tortas_aux = []

op = "Y"
until op == "N"
    puts "\tIngresa de que quieres hacer tortas"
    tipo_torta = gets.chomp.downcase
    puts "\tElige su tamaño"
    puts "\tMitad  (12 por charola)" 
    puts "\tNormal (6 por charola)"
    puts "\tGrande (4 por charola)"
    t = gets.chomp.downcase
    puts "\tElige el tiempo de cocción"
    tiempo_coccion = gets.chomp.to_i

    puts "\t¿Cuántas de éstas tortas deseas?"
    cant = gets.chomp.to_i
    for i in 1..cant
      tortas_aux << Torta.new(tipo_torta, t, tiempo_coccion)
    end
    puts "Deseas ingresar más tortas? Y/N"
    op = gets.chomp.upcase
end

until horno.fill?
    tortas_aux.each do |torta|
        $tiempo_horno = rand(9)
        until charola.fill?
            charola.fill(torta.tam)
            torta.coccion
        end    
        charola.clean
    end   
    horno.fill
end

tortas_aux.each do |torta|
    if torta.estatus == "cruda"
        crudas += 1
    elsif torta.estatus == "quemada"
        quemadas += 1
    elsif torta.estatus == "casi lista"
        casi_listas += 1
    elsif torta.estatus == "lista"
        listas += 0
    end
end

puts "\tObtuviste #{listas} tortas listas!"
puts "\tObtuviste #{casi_listas} tortas casi listas"
puts "\tObtuviste #{quemadas} tortas quemadas! Ups!!"
puts "\tObtuviste #{crudas} tortas crudas! Muy pronto!"
puts "\tHiciste #{tortas_aux.count} tortas!"





  






        
