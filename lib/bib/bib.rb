include Comparable
module Bib
     class Biblio
     
          attr_reader :autor
          attr_reader :titulo
          def initialize()
               
          end
          def <=>(anOther)
               aux1=@titulo
               aux2=anOther.get_titulo[0]
               aux1[0] <=> aux2[0]
          end
          
          
          def set_autor(nombre)
               @autor = []
               @autor.push(nombre)
          end
          def get_autor
               @autor.join(",")
          end
          def titulo_poner(titulo)
               @titulo=titulo
          end
          def get_titulo
               @titulo
          end
          
          def fecha_poner(fecha)
               @fecha = fecha
               if (@fecha == "") 
                    return RuntimeError
               end
          end
     
          def get_fecha
               @fecha
          end
     
     end
     
     class Libro < Biblio
          def initialize()
               
          end
          def isbn_poner(isbn)
              @isbn = []
              @isbn.push(isbn)
          end
          def get_isbn
               @isbn.join(",")
               
          end
          
          def serie_poner(serie)
               @serie = serie
          end
     
          def get_serie
               @serie
          end
          
          def editorial_poner(editorial)
               @editorial = editorial
               if (@editorial == "") 
                    return RuntimeError
               end
          end
     
          def get_editorial
               @editorial
          end
          
          def edicion_poner(edicion)
               
               if(edicion.is_a? Integer)
                    @edicion = edicion
               else
                    return RuntimeError
               end
          end
     
          def get_edicion
               @edicion
          end
          
          def formateo
               aux=""
               aux=aux<<"#{get_autor}\n#{get_titulo}\n(#{get_serie})\n#{get_editorial}; #{get_edicion} edition (#{get_fecha})\n#{get_isbn}\n"
               #get_titulo
               #get_edicion
               #get_editorial
               #get_fecha
               #get_isbn
          end
     end
     
     class Art_rev < Biblio   #Articulo de revista
     #Nombre de la revista: Nombre de la revista tal como sale en la portada del periódico. en cursiva.
     #Volumen: El volumen de la revista en la que se publicó el articulo. Va en cursiva.
     #Numero: El numero de la revista en la que se publicó el articulo. Entre paréntesis.
     #Paginas: Paginas entre las que esta impreso el articulo
          def initialize()
               
          end
          def set_nombre_rev(nombre)
              @nombre_rev=nombre
               if (@nombre_rev == "") 
                    return RuntimeError
               end
          end
          def get_nombre_rev
               @nombre_rev
          end
          
          def set_volumen(nombre)
              @volumen=nombre
               if (@volumen == "") 
                    return RuntimeError
               end
          end
          def get_volumen
               @volumen
          end
          
          def set_numero(nombre)
              @numero=nombre
               if (@numero == "") 
                    return RuntimeError
               end
          end
          def get_numero
               @numero
          end
          
          def set_paginas(nombre)
              @paginas=nombre
               if (@paginas == "") 
                    return RuntimeError
               end
          end
          def get_paginas
               @paginas
          end
          
          def formateo
               aux=""
               aux=aux<<"#{get_autor} (#{get_fecha}). #{get_titulo}. #{get_nombre_rev}, #{get_volumen} (#{get_numero}), pp. #{get_paginas}."
               #ejemplo  Apellido, A. A. (Fecha). Título del artículo. Nombre de la revista. Volumen(Número), pp-pp.
          end
     end
     
     class Art_period < Biblio     #articulo de periodico
          def set_nombre_periodico(nombre)
              @nombre_rev=nombre
               if (@nombre_rev == "") 
                    return RuntimeError
               end
          end
          def get_nombre_periodico
               @nombre_rev
          end
     
          def set_paginas(nombre)
              @paginas=nombre
               if (@paginas == "") 
                    return RuntimeError
               end
          end
          def get_paginas
               @paginas
          end
          def formateo
               aux=""
               aux=aux<<"#{get_autor} (#{get_fecha}). #{get_titulo}. #{get_nombre_periodico}, pp. #{get_paginas}."
               #ejemplo  Apellido, A. A. (Fecha). Título del artículo. Nombre de la revista. Volumen(Número), pp-pp.
          end
     end
     
     class Edoc < Biblio           #Documento electronico
          def initialize()
          end
          def set_tipo(tipo)
               @tipo=tipo
               if (@tipo == "") 
                    return RuntimeError
               end
          end
          def get_tipo
               @tipo
          end
          
          def set_fuente(url)
               @url=url
               if (@url == "") 
                    return RuntimeError
               end
          end
          def get_tipo
               @url
          end
          def formateo
               aux=""
               aux=aux<<"#{get_autor} (#{get_fecha}). #{get_titulo}. [#{get_tipo}], URL: #{get_paginas}."
               #ejemplo  Apellido, A. A. (Fecha). Título del artículo. Nombre de la revista. Volumen(Número), pp-pp.
          end
     end
end


#articulo de revista

#ELEMENTOS:

#Nombre: Se pone el primer apellido seguido de las iniciales.
#Fecha: Entre paréntesis se pone la fecha de la publicación del articulo o del periódico.
#Titulo: Titulo del articulo tal como sale en el periódico.
#Nombre de la revista: Nombre de la revista tal como sale en la portada del periódico. en cursiva.
#Volumen: El volumen de la revista en la que se publicó el articulo. Va en cursiva.
#Numero: El numero de la revista en la que se publicó el articulo. Entre paréntesis.
#Paginas: Paginas entre las que esta impreso el articulo

#ejemplo  Apellido, A. A. (Fecha). Título del artículo. Nombre de la revista. Volumen(Número), pp-pp.
#         Newman, V. (13 de noviembre de 2010). La información: ¿en la urna de cristal?. Semana, (15), p. 10.

#articulo de periodico
#ELEMENTOS:

#Nombre: Se pone el primer apellido seguido de las iniciales.
#Fecha: Entre paréntesis se pone la fecha de la publicación del articulo o del periódico.
#Titulo: Titulo del articulo tal como sale en el periódico.
#Nombre del periódico: Nombre del periódico tal como sale en la portada del periódico. en cursiva.
#Paginas: Paginas entre las que esta impreso el articulo.

#Ejemplo  Apellido A. A. (Fecha). Título del artículo. Nombre del periódico, pp-pp
#         Manrique Grisales, J. (14 de noviembre de 2010). La bestia que se tragó Armero. El Espectador, pp. 16-17.

#Documento electronico
#ELEMENTOS:
#Autor, fecha, título (cursiva),en dicho caso, señalar si es libro tipo e-reader (entre corchetes), y la fuente (URL o DOI).

#Libro
#Debe existir uno o mas autores.
#Debe existir un tıtulo.
#Debe existir o no una serie.
#Debe existir una editorial.
#Debe existir un numero de edici´on.
#Debe existir una fecha de publicacion.
#Debe existir uno o mas numeros ISBN.
