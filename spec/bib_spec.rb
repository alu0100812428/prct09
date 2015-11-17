require 'spec_helper'
require 'bib'
require 'bib/lista'
describe Bib::Biblio do
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
    
    describe "Biblio" do
        it "Hay al menos un autor almacenado" do
            @p.get_autor.should eq("pablo sebastian")
        end
        it "varios autores almacenados correctamente" do
            @q.get_autor.should eq("pablo sebastian, oscar catari")
        end
    
        it "Hay un titulo almacenado" do
            @p.get_titulo.should eq("Lenguajes y Paradigmas")
        end

    

        it "Existe una serie" do
            @p.get_serie.should eq("Ruby")
        end
        it "No existe una serie" do
            @q.get_serie.should eq("")
        end

    

        it "Existe editorial" do
            @p.get_editorial.should eq("Santillana")
        end
        it " No existe editorial" do
            @q.editorial_poner("").should eq(RuntimeError)
        end
    

        it "Existe numero edicion" do
            @p.get_edicion.should eq(4)
        end
        it "No existe numero edicion" do
            @q.edicion_poner("4").should eq(RuntimeError)
        end

    

        it "Existe fecha de publicacion" do
            @p.get_fecha.should eq("july 7,2015")
        end
        it "No existe fecha de publicacion" do
            @q.fecha_poner("").should eq(RuntimeError)
        end
        

        it "Existe un numero ISBN" do
            @p.get_isbn.should eq("ISBN-10: 1234512345")
        end
        it "Existe varios numeros ISBN" do
            @q.get_isbn.should eq("ISBN-10: 1234512345,ISBN-13:1234512345123")
        end

        it "Formateo de la referencia" do
            @p.formateo.should eq("pablo sebastian\nLenguajes y Paradigmas\n(Ruby)\nSantillana; 4 edition (july 7,2015)\nISBN-10: 1234512345\n")
        end
    end
    ########################################################################################################################################
    describe "Formeteo de referencias"do
        it "Primera referencia" do
            @ref1.formateo.should eq("Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers’Guide.\n(The Facets of Ruby)\nPragmatic Bookshelf; 4 edition (August 27, 2009)\nISBN-13: 978-1937785499,ISBN-10: 1937785491\n")
        end
        
        it "Segunda referencia" do
            @ref2.formateo.should eq("Scott Chacon\nPro Git 2009th Edition\n(Pro)\nApress; 1 edition (August 27, 2009)\nISBN-13: 978-1430218333, ISBN-10: 1430218339\n")
        end
 
        it "Tercera referencia" do
            @ref3.formateo.should eq("David Flanagan, Yukihiro Matsumoto\nThe Ruby Programming Language\n()\nO’Reilly Media; 1 edition (February4, 2008)\nISBN-10: 0596516177, ISBN-13: 978-0596516178\n")
        end
        
        it "Cuarta referencia" do
            @ref4.formateo.should eq("David Chelimsky, Dave Astels, Bryan Helmkamp, Dan North, Zach Dennis, Aslak Hellesoy\nThe RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends\n(The Facets of Ruby)\nPragmatic Bookshelf; 1 edition (December 25, 2010)\nISBN-10: 1934356379, ISBN-13: 978-1934356371.\n")
        end

        it "Quinta referencia" do
            @ref5.formateo.should eq("Richard E.\nSilverman Git Pocket Guide\n()\nO’Reilly Media; 1 edition (August 2, 2013)\nISBN-10: 1449325866,ISBN-13: 978-1449325862.\n")
        end

            
    end
    
    describe "Lista de referencias" do
        it "Primera referencia insertada" do
            @list_ref = Lista.new()
            @list_ref.insert_end(@ref1.formateo)
            @list_ref.mostrar().should eq("Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers’Guide.\n(The Facets of Ruby)\nPragmatic Bookshelf; 4 edition (August 27, 2009)\nISBN-13: 978-1937785499,ISBN-10: 1937785491\n")
        end
        
        it "Segunda referencia insertada" do
            @list_ref = Lista.new()
            @list_ref.insert_end(@ref1.formateo)
            @list_ref.insert_end(@ref2.formateo)
            @list_ref.mostrar().should eq("Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers’Guide.\n(The Facets of Ruby)\nPragmatic Bookshelf; 4 edition (August 27, 2009)\nISBN-13: 978-1937785499,ISBN-10: 1937785491\n,Scott Chacon\nPro Git 2009th Edition\n(Pro)\nApress; 1 edition (August 27, 2009)\nISBN-13: 978-1430218333, ISBN-10: 1430218339\n")
        end
        
        it "Extraer referencia insertada" do
            @list_ref = Lista.new()
            @list_ref.insert_end(@ref1.formateo)
            @list_ref.insert_end(@ref2.formateo)
            @list_ref.extract_end
            @list_ref.mostrar().should eq("Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers’Guide.\n(The Facets of Ruby)\nPragmatic Bookshelf; 4 edition (August 27, 2009)\nISBN-13: 978-1937785499,ISBN-10: 1937785491\n")
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
