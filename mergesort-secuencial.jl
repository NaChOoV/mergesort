#=
@author Ignacio Fuenzalida Veas
=#
function mergesort(array)

    #Array = 1 esta ordenado
    length(array) == 1 && return array

    middle = div(length(array),2)
    leftArray = mergesort(array[1:middle])
    rightArray = mergesort(array[middle+1:length(array)])

    #array temporal de tamñano head con enteros
    temp = Array{Int64}(undef, length(array))
    i, j = 1,1

    #Merge ambos arrays
    for k = 1:length(temp)
        if (j > length(rightArray)) || i <= length(leftArray) && leftArray[i] < rightArray[j]
            temp[k] = leftArray[i]
            i += 1
        else
            temp[k] = rightArray[j]
            j += 1
        end
    end

    #Retorna el array
    return temp

end


tamanio = 10
array = [rem(rand(Int64),1000) for i =1:tamanio];

println("Array:")
println(array)
println("Array :")
@time println(mergesort(copy(array)));
#@time mergesort(copy(array));
