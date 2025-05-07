__author__ = 'david'


def f_linear(n, val):
    return val


def f_quadratic(n, A):
    return A * n


def read_all(K, N_list, alpha_list, tl_list, eta):
    fout_name = f'./Results/FMS_KSAT_all_K_{K}.txt'
    fout = open(fout_name, "w")
    fout.write("#  N   alpha   maxiter  av(e)   err(e)  P(sol)  err(Psol)  av(niter)   std(niter)  av(runtime)  str(runtime)  nsamples\n")
    for j in range(len(N_list)):
        N = N_list[j]
        for tl in tl_list[j]:
            for alpha in alpha_list:
                fin_name = f'./Results/AllData/FMS_all_K_{K}_N_{N}_eta_{eta}_alpha_{alpha}_tl_{tl}.txt'
                try:
                    fin = open(fin_name, "r")
                    
                    fin.readline()
                    line = fin.readline().split()
                    nsampl = int(line[3].split("=")[1])
                    line = fin.readline().split()
                    av_it = float(line[1])
                    line = fin.readline().split()
                    err_it = float(line[1])
                    line = fin.readline().split()
                    av_e = float(line[1])
                    line = fin.readline().split()
                    err_e = float(line[1])
                    line = fin.readline().split()
                    av_rt = float(line[1])
                    line = fin.readline().split()
                    err_rt = float(line[1])
                    
                    nsols = 0
                    seed_list = []
                    while True:
                        j = fin.readline()
                        if not j:
                            break
                        line = j.split()
                        if line[0] == "0.0":
                            nsols += 1
                        if int(line[3]) in seed_list:
                            print("Repeated seed in file " + fin_name)
                        else:
                            seed_list.append(int(line[3]))
                    psol = nsols / nsampl
                    err_psol = (psol * (1 - psol) / nsampl) ** 0.5

                    fin.close()
                    
                    fout.write(str(N) + "\t" + str("{0:.2f}".format(alpha)) + "\t" + str(tl) + "\t" + str("{0:.3f}".format(av_e))
                            + "\t" + str("{0:.3f}".format(err_e)) + "\t" + str("{0:.3f}".format(psol)) + "\t" + str("{0:.3f}".format(err_psol)) + "\t" 
                            + str("{0:.3f}".format(av_it)) + "\t" + str("{0:.3f}".format(err_it)) + "\t"
                            + str("{0:.3f}".format(av_rt)) + "\t" + str("{0:.3f}".format(err_rt)) + "\t" + str(nsampl) + "\n")
                except(OSError, IOError):
                    # print(fin_name + "  not read")
                    continue
    fout.close()


def build_tl_list(N_list, func_list):
    tl_list = []
    for i in range(len(N_list)):
        tl_list.append([])
        for j in range(len(func_list)):
            tl_list[i].append(func_list[j](N_list[i]))
    return tl_list


def main():
    exp_n_list = [10, 11, 12, 13, 14, 15, 16]
    K = 3
    eta="370"
    alpha_list = [397, 404, 410, 412, 414, 416, 418, 419, 420, 421, 422, 423, 424, 426]
    # K = 4
    # eta="293"
    # alpha_list = [940, 948, 950, 955, 956, 958, 960, 962, 964, 966, 968, 970, 972, 974, 976, 980, 990]
    func_list = [lambda n: f_linear(n, 50000), lambda n: f_quadratic(n, 16), lambda n: f_quadratic(n, 1000)]

    N_list = list(map(lambda x: 2 ** x, exp_n_list))

    tl_list = build_tl_list(N_list, func_list)

    read_all(K, N_list, alpha_list, tl_list, eta)

    return 0


if __name__ == '__main__':
    main()
