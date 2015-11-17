require 'spec_helper'
require 'bib/lista'

describe Lista do
    before :each do
        @p = Bib::Biblio.new("pablo sebastian")
        @p.titulo_poner("Lenguajes y Paradigmas")
        @p.serie_poner("Ruby")
        @p.editorial_poner("Santillana")
        @q = Bib::Biblio.new("pablo sebastian, oscar catari")
        @q.serie_poner("")
        @p.edicion_poner(4)
        @p.fecha_poner("july 7,2015")
        @p.isbn_poner("ISBN-10: 1234512345")
        @q.isbn_poner("ISBN-10: 1234512345,ISBN-13:1234512345123")
        #################################################################################
        @nodo = Node.new(22)
        @nodo2 = Node.new(33)
        #################################################################################
        @ref1 = Bib::Biblio.new("Dave Thomas, Andy Hunt, Chad Fowler")
        @ref1.titulo_poner("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’Guide.")
        @ref1.serie_poner("The Facets of Ruby")
        @ref1.editorial_poner("Pragmatic Bookshelf")
        @ref1.edicion_poner(4)
        @ref1.fecha_poner("August 27, 2009")
        @ref1.isbn_poner("ISBN-13: 978-1937785499,ISBN-10: 1937785491")
        
        @ref2 = Bib::Biblio.new("Scott Chacon")
        @ref2.titulo_poner("Pro Git 2009th Edition")
        @ref2.serie_poner("Pro")
        @ref2.editorial_poner("Apress")
        @ref2.edicion_poner(1)
        @ref2.fecha_poner("August 27, 2009")
        @ref2.isbn_poner("ISBN-13: 978-1430218333, ISBN-10: 1430218339")
        
        @ref3 = Bib::Biblio.new("David Flanagan, Yukihiro Matsumoto")
        @ref3.titulo_poner("The Ruby Programming Language")
        @ref3.serie_poner("")
        @ref3.editorial_poner("O’Reilly Media")
        @ref3.edicion_poner(1)
        @ref3.fecha_poner("February4, 2008")
        @ref3.isbn_poner("ISBN-10: 0596516177, ISBN-13: 978-0596516178")
        
        @ref4 = Bib::Biblio.new("David Chelimsky, Dave Astels, Bryan Helmkamp, Dan North, Zach Dennis, Aslak Hellesoy")
        @ref4.titulo_poner("The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends")
        @ref4.serie_poner("The Facets of Ruby")
        @ref4.editorial_poner("Pragmatic Bookshelf")
        @ref4.edicion_poner(1)
        @ref4.fecha_poner("December 25, 2010")
        @ref4.isbn_poner("ISBN-10: 1934356379, ISBN-13: 978-1934356371.")
        
        @ref5 = Bib::Biblio.new("Richard E.")
        @ref5.titulo_poner("Silverman Git Pocket Guide")
        @ref5.serie_poner("")
        @ref5.editorial_poner("O’Reilly Media")
        @ref5.edicion_poner(1)
        @ref5.fecha_poner("August 2, 2013")
        @ref5.isbn_poner("ISBN-10: 1449325866,ISBN-13: 978-1449325862.")
    end
    
    describe "Lista enlazada" do
        it "insertar final" do
            @lista = Lista.new()
            @lista.insert_end(22)
            @lista.insert_end(33)
            @lista.mostrar.should eq("22,33")
        end
        
        it "insertar inicio" do
            @lista = Lista.new()
            @lista.insert_beggining(22)
            @lista.insert_beggining(33)
            @lista.mostrar.should eq("33,22")
        end
        
        it "insertar mix" do
            @lista = Lista.new()
            @lista.insert_beggining(2)
            @lista.insert_end(3)
            @lista.insert_beggining(1)
            @lista.insert_end(4)
            @lista.mostrar.should eq("1,2,3,4")
        end
        
        it "extraer final" do
            @lista = Lista.new()
            @lista.insert_end(22)
            @lista.insert_end(33)
            @lista.extract_end
            @lista.mostrar.should eq("22")
        end
        
        it "extraer inicio" do
            @lista = Lista.new()
            @lista.insert_beggining(22)
            @lista.insert_beggining(33)
            @lista.extract_begginig
            @lista.mostrar.should eq("22")
        end
        #expect(@nodo.siguiente).to eq(nil
    end
    
end