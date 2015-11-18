require 'spec_helper'
require 'bib'
require 'bib/lista'
describe Bib::Biblio do
    before :each do
        @ref1 = Bib::Libro.new()
        @ref1.set_autor("Dave Thomas, Andy Hunt, Chad Fowler")
        @ref1.titulo_poner("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’Guide.")
        @ref1.serie_poner("The Facets of Ruby")
        @ref1.editorial_poner("Pragmatic Bookshelf")
        @ref1.edicion_poner(4)
        @ref1.fecha_poner("August 27, 2009")
        @ref1.isbn_poner("ISBN-13: 978-1937785499,ISBN-10: 1937785491")
        ######################################
        @ref2 = Bib::Libro.new()
        @ref2.set_autor("Scott Chacon")
        @ref2.titulo_poner("Pro Git 2009th Edition")
        @ref2.serie_poner("Pro")
        @ref2.editorial_poner("Apress")
        @ref2.edicion_poner(1)
        @ref2.fecha_poner("August 27, 2009")
        @ref2.isbn_poner("ISBN-13: 978-1430218333, ISBN-10: 1430218339")
        ######################################
        @ref3 = Bib::Art_period.new()
        @ref3.set_autor("Manrique Grisales, J.")
        @ref3.titulo_poner("La bestia que se tragó Armero")
        @ref3.fecha_poner("14 de noviembre de 2010")
        @ref3.set_nombre_periodico("El Espectador")
        @ref3.set_paginas("16-17")
        ######################################
        @ref4 = Bib::Art_rev.new()
        @ref4.set_autor("Newman, V.")
        @ref4.titulo_poner("La información: ¿en la urna de cristal?")
        @ref4.fecha_poner("13 de noviembre de 2010")
        @ref4.set_nombre_rev("Semana")
        @ref4.set_numero(15)
        @ref4.set_volumen("Primero")
        @ref4.set_paginas("10")
        ######################################
        @ref5 = Bib::Edoc.new()
        @ref5.set_autor("Peter, P.")
        @ref5.titulo_poner("Documento electrónico")
        @ref5.fecha_poner("13 de noviembre de 2010")
        @ref5.set_tipo("e-reader")
        @ref5.set_fuente("https://es.wikipedia.org/wiki/Documento_electr%C3%B3nico")
    end
    ########################################################################################################################################
    describe "Formeteo de referencia de Libro"do
        it "Primera referencia" do
            @ref1.formateo.should eq("Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers’Guide.\n(The Facets of Ruby)\nPragmatic Bookshelf; 4 edition (August 27, 2009)\nISBN-13: 978-1937785499,ISBN-10: 1937785491\n")
        end
        
        it "Segunda referencia" do
            @ref2.formateo.should eq("Scott Chacon\nPro Git 2009th Edition\n(Pro)\nApress; 1 edition (August 27, 2009)\nISBN-13: 978-1430218333, ISBN-10: 1430218339\n")
        end
    end
    
    describe "Comprobacion de herencia" do
        it "referencias nuevas" do
            expect(@ref3.formateo).to eq("Manrique Grisales, J. (14 de noviembre de 2010). La bestia que se tragó Armero. El Espectador, pp. 16-17.")
            expect(@ref4.formateo).to eq("Newman, V. (13 de noviembre de 2010). La información: ¿en la urna de cristal?. Semana, Primero (15), pp. 10.")
        end
        it "Herencia de Libro"do
            expect(@ref1.is_a?Object).to eq(true)
            expect(@ref1.is_a?Bib::Biblio).to eq(true)
            expect(@ref1.is_a?Bib::Libro).to eq(true)
        end
        it "Herencia de articulo de revista"do
            expect(@ref4.is_a?Bib::Biblio).to eq(true)
        end
        it "Herencia de articulo de periodico"do
            expect(@ref3.is_a?Bib::Biblio).to eq(true)
        end
        it "Herencia de Documento electrónico"do
            expect(@ref5.is_a?Bib::Biblio).to eq(true)
        end
    end
    
end

#Node
#Debe existir un Nodo de la lista con sus datos y su siguiente  OK
#List
#Se extrae el primer elemento de la lista   ok
#Se puede insertar un elemento              ok
#Se pueden insertar varios elementos        ok
#Debe existir una Lista con su cabeza       ok


#libros y publicaciones periodicas (artıculo de revista, art´ıculo de peri´odico y documento electr´onico )