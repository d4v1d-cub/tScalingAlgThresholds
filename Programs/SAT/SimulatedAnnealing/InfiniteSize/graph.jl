using Random
using SimpleHypergraphs

function Nodos(nodos::Dict{Int,Bool},N::Int)::Int
    n=rand(1:N,1)[1]
    while haskey(nodos,n)
        n=rand(1:N,1)[1]
    end
    return n
end

function CrearHGraph(N::Int,M::Int,s::Int,K::Int)::Hypergraph{Bool,Bool,UInt8}
    Random.seed!(s)
    h=Hypergraph{Bool,Bool,UInt8}(N,M)
    for i in 1:M
        valor=rand(0:1,K)
        for j in 1:K
            h[Nodos(h.he2v[i],N),i]=valor[j]
        end
    end
    return h
end

function ImprimeG(h::Hypergraph{Bool,Bool,UInt8},s::Int,ruta::String,K::Int)
    N=length(h.v_meta)
    M=length(h.he_meta)

    f=open(ruta*"G/grapho_N-$(N)_M-$(M)_K-$(K)_s-$(s).txt","w")
    for i in 1:M
        print(f,i)
        for v in keys(h.he2v[i])
            print(f,"\t")
            print(f,v*(2*h.he2v[i][v]-1))
        end
        println(f)
    end
    close(f)
end

s1=parse(Int,ARGS[1])
s2=parse(Int,ARGS[2])
K=parse(Int,ARGS[3])
N=parse(Int,ARGS[4])
alpha=parse(Int,ARGS[5])

ruta="./D/"

for s in s1:s2
    ImprimeG(CrearHGraph(N,Int64(floor(alpha*N/100)),s,K),s,ruta,K)
end
