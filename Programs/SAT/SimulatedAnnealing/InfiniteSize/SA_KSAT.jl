using Random
using SimpleHypergraphs

mutable struct Spin
    greedy::Int
    estado::Bool
end

function LeeGraph(N::Int,M::Int,K::Int,s::Int,ruta::String)::Hypergraph{Bool,Spin,UInt8}
    f=open(ruta*"G/grapho_N-$(N)_M-$(M)_K-$(K)_s-$(s).txt")
    h=Hypergraph{Bool,Spin,UInt8}(N,M)
    for i in 1:M
        l=parse.(Int,split(readline(f)))
        for j in 2:(K+1)
            h[abs(l[j]),i]=(l[j]>0)
        end
    end
    close(f)
    return h
end

function LeeVal!(h::Hypergraph{Bool,Spin,UInt8},N::Int,M::Int,K::Int,s::Int,n::Int,ruta::String)::Int
    f=open(ruta*"B/valores_N-$(N)_M-$(M)_K-$(K)_s-$(s)_n-$(n).txt","a+")
    ls=readlines(f)
    close(f)
    if length(ls)==0
        for v in 1:N
            h.v_meta[v]=Spin(0,(rand()<0.5))
        end
    else
        for v in 1:N
            h.v_meta[v]=Spin(0,parse(Bool,split(ls[v])[2]))
        end
    end
    CUnsats=0
    for k in keys(h.he_meta)
        h.he_meta[k]=0
        for n in keys(h.he2v[k])
            h.he_meta[k]+= !xor(h.v_meta[n].estado,h.he2v[k][n])
        end
        if h.he_meta[k]==0
            CUnsats+=1
        else
            for n in keys(h.he2v[k])
                h.v_meta[n].greedy+=1
            end
        end
    end
    return CUnsats
end

function Invierte!(h::Hypergraph{Bool,Spin,UInt8},v::Int,E::Int)::Int
    h.v_meta[v].estado=!h.v_meta[v].estado
    for i in keys(h.v2he[v])
        s1=1-2*xor(h.v_meta[v].estado,h.he2v[i][v])
        s2=((h.he_meta[i]==0)||((h.he_meta[i]+s1)==0))*s1
        h.he_meta[i]+=s1
        if s2!=0
            E-=s2
            for j in keys(h.he2v[i])
                h.v_meta[j].greedy+=s2
            end
        end
    end
    return E
end

function MC!(h::Hypergraph{Bool,Spin,UInt8},T::Float64,E::Int,s::Int,pasosMC::Int)
    for i in 1:pasosMC
        E1=E
        for t in 1:length(h.v_meta)
            v=rand(keys(h.v_meta),1)[1]
            insatisfacen=0
            for k in keys(h.v2he[v])
                insatisfacen+=Int((h.he_meta[k]==1)&&(!xor(h.v_meta[v].estado,h.he2v[k][v])))
            end
            if rand()<exp((length(h.v2he[v])-h.v_meta[v].greedy-insatisfacen)/T)
                E1=Invierte!(h,v,E1)
                if E1==0
                    break
                end
            end
        end
        temp=E
        E=E1
        E1=temp
        if E==0
            break
        end
    end
    return E
end

function imprimeEnColumna(columna1,columna2::Float64,ruta::String,nombre::String)
    f=open(ruta*nombre,"a")
    print(f,columna1)
    print(f,"\t")
    print(f,columna2)
    println(f)
    close(f)
end

function llama(N::Int,M::Int,s::Int,K::Int,t::Int,T0::Float64,ns::Vector{Int},ruta::String)
    h=LeeGraph(N,M,K,s,ruta)
    for n in ns
        E=LeeVal!(h,N,M,K,s,n,ruta)
        for i in n:(-1):0
            if E==0
                break
            end
            E=MC!(h,T0*i/n,E,s,t)
        end
        imprimeEnColumna(n,Float64(E)/N,ruta,"D/n-VS-Ef_ZonaSat-Unsat_MC_alpha-$(Float16(M/N))_s-$(s)_N-$(N)_t-$(t)MC")
        if E==0
            break
        end
    end
end

s1=parse(Int,ARGS[1])
s2=parse(Int,ARGS[2])
K=parse(Int,ARGS[3])
N=parse(Int,ARGS[4])
alpha=parse(Int,ARGS[5])


t=1
T0=1.0
n0=10
nf=176776
ruta="./D/"

for s in s1:s2
    puntos=11
    ns=[Int(floor(n0*(nf/n0)^(i/(puntos-1)))) for i in 0:(puntos-1)]
#    ns=[176776]
    llama(N,Int64(floor(alpha*N/100)),s,K,t,T0,ns,ruta)
end
