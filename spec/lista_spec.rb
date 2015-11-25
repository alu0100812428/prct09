require 'spec_helper'
require 'bib/lista'

describe Lista do
    before :each do
        @list = Lista.new()
        @list.insert_end(1)
        @list.insert_end(2)
        @list.insert_end(3)
        @list.insert_end(4)
        @list2 = Lista.new()
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
    end
    describe "Enumerable" do
        it "comprobrando el metodo all? con un bloque vacio" do
            @list2.insert_end(nil)
            expect(@list.all?).to eq(true)
            expect(@list2.all?).to eq(false)
        end
        it "comprobrando el metodo any?" do
            expect(@list.any?).to eq(true)
            expect(@list2.any?).to eq(false)
        end
        
        it "comprobrando el metodo collect" do
            expect(@list.map{|i| i*i}).to eq([16,9,4,1])
            expect(@list.collect{|i| i*i}).to eq([16,9,4,1])
        end 
        it "comprobrando el metodo count" do
            expect(@list.count).to eq(4)
        end
        it "comprobrando el metodo detect" do
            expect(@list.detect {|i| i == 1}).to eq(1)
            expect(@list.find {|i| i == 1}).to eq(1)
        end
        it "comprobrando drop" do
            expect(@list.drop(2)).to eq([2,1])
        end
        
        
        it "maximo" do
            expect(@list.max).to eq(4)
        end
        
         it "minimo" do
            expect(@list.min).to eq(1)
        end
    end
end