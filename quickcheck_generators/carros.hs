import Test.QuickCheck


data Carro = Carro Tipo Marca Matricula NIF CPKm Autonomia
                deriving Show

data Tipo = Combustao
            | Eletrico
            | Hibrido
                deriving Show

type Marca = String
type Matricula = String
type NIF = String -- NIF Proprietario
type CPKm = Float -- Consumo por Km
type Autonomia = Int

genTipo :: Gen Tipo
genTipo = frequency [(70, return Combustao),
                     (5, return Eletrico),
                     (25, return Hibrido)]

genCPKm :: Gen CPKm
genCPKm = choose(0.1,2) 

genAutonomia :: Gen Autonomia
genAutonomia = elements [300..1000] 

genMarca :: Gen Marca
genMarca = elements ["Audi", 
                     "BMW", 
                     "Citroen", 
                     "Dacia", 
                     "Fiat", 
                     "Ford", 
                     "Honda", 
                     "Hyundai", 
                     "Kia", 
                     "Lexus", 
                     "Mazda", 
                     "Mercedes-Benz", 
                     "Nissan", 
                     "Opel", 
                     "Peugeot", 
                     "Renault", 
                     "Seat", 
                     "Skoda", 
                     "Suzuki",
                     "Tesla",
                     "Toyota", 
                     "Volkswagen", 
                     "Volvo"]

genMatricula :: Gen Matricula
genMatricula = do
    l1 <- choose('A','Z')
    l2 <- choose('A','Z')
    n1 <- elements [0..9]
    n2 <- elements [0..9]
    n3 <- elements [0..9]
    n4 <- elements [0..9]
    return (([l1,l2]) ++ "-" ++ (concatMap show [n1,n2] ++ "-" ++ (concatMap show [n3,n4])))

genCarro :: [NIF] -> Gen Carro
genCarro lnif = do
    tipo <- genTipo
    marca <- genMarca
    matricula <- genMatricula
    nif <- elements lnif
    cpkm <- genCPKm
    autonomia <- genAutonomia
    return (Carro tipo marca matricula nif cpkm autonomia)

