require 'spec_helper'
require 'bib/lista'

describe Lista do
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
    end
    
end