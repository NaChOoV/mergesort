using Distributed
import Base.Threads.@spawn

#=
@author Ignacio Fuenzalida veas
=#

# mergesort_paralelo
function mergesort_paralelo!(array, tail::Int64=1, head::Int64=length(array))
    # retornamos si el array es unico
    if tail >= head && return array end

    middle = div(head+tail,2)
    #Se resuelve la parte izquierda
    leftArray = @spawn mergesort_paralelo!(array, tail, middle)
    #Se resuelve la parte derecha
    mergesort_paralelo!(array, middle+1, head)

    #Esperamos al izquierda
    wait(leftArray)

    #Array temporal par aunir ambos
    temp = array[tail:middle]

    i ,k ,j = 1, tail, middle + 1
    #merge los dos arrays en un temporal
    @inbounds while k < j <= head

        if array[j] < temp[i]
            array[k] = array[j]
            j += 1
        else
            array[k] = temp[i]
            i += 1
        end
        k += 1
    end
    @inbounds while k < j
        array[k] = temp[i]
        k += 1
        i += 1
    end

    return array

end



#Tamanio del array a evaluar
tamanio = 10000000;
#Genracion de array
array = [rem(rand(Int64),100) for i =1:tamanio]
@time mergesort_paralelo!(array);
