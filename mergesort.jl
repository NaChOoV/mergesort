#=
@author Ignacio Fuenzalida Veas
=#



function mergesort(array, inicio = 1, final = length(array))
    if inicio < final
        mitad = div(inicio+final,2)
        mergesort(array,inicio,mitad)
        mergesort(array,mitad+1,final)
        merge(array, inicio, mitad, final)

    end
    return array
end




# largo del array y numeros totales a
numerosTotales = 100000
# Se genera un array de 1xn numeros aleatorios enteros
array = rand(1:numerosTotales,numerosTotales::Int64)

println(array)
sort!(array, alg = MergeSort)
println(array)
