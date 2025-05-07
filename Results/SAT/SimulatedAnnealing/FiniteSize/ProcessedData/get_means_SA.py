__author__ = 'david'


def read_all(k, n_list, alpha_list, nit_list):
    fout_name = "./SA/Results/K_" + str(k) + "/SA_KSAT_all_K_" + str(k) + ".txt"
    fout = open(fout_name, "w")
    fout.write("#  N   alpha   nIter  av(e)   err(e)   P(sol)    nsamples\n")
    for j in range(len(n_list)):
        n = n_list[j]
        for nit in nit_list[j]:
            for alpha in alpha_list:
                fin_name = "./SA/Results/K_" + str(k) + "/AllData/SA_KSAT_N_" + str(n) + "_K_" + str(k) + "_alpha_" + \
                            str(alpha) + "_nIt_" + str(nit) + ".txt"
                try:
                    fin = open(fin_name, "r")
                    fin.readline()
                    line = fin.readline().split()
                    nsampl = int(line[3].split("=")[1])
                    line = fin.readline().split()
                    av_e = float(line[1])
                    line = fin.readline().split()
                    err_e = float(line[1])
                    counter = 0
                    for _ in range(nsampl):
                        line = fin.readline().split()
                        if float(float(line[0]) < 0.5):
                            counter += 1
                    psol = counter / nsampl
                    fin.close()
                    fout.write(str(n) + "\t" + str("{0:.2f}".format(alpha)) + "\t" + str(nit) + "\t" + str("{0:.3f}".format(av_e))
                            + "\t" + str("{0:.3f}".format(err_e)) + "\t" + str("{0:.3f}".format(psol)) + "\t" + str(nsampl) + "\n")
                except(OSError, IOError):
                    print(fin_name + "  not read")
                    continue
    fout.close()


def main():
    exp_n_list = [13, 14, 15, 16, 17, 18, 19]
    k = 4
    alpha_list = [9.0, 9.05, 9.1, 9.15, 9.17, 9.2, 9.23, 9.25, 9.28, 9.3, 
                  9.32, 9.33, 9.35, 9.37, 9.38, 9.4, 9.42, 9.44, 9.45, 9.47, 
                  9.48, 9.5, 9.53, 9.55, 9.57, 9.6, 9.7, 9.8, 9.9]
    difs = [-2, 3]
    
    n_it_l = []
    exp_cubic = 10
    exp_quartic = 10
    for exp_n in exp_n_list:
        nit_each = []
        for dif in difs:
            nit_each.append(2 ** (exp_n + dif))
        if 2 ** exp_cubic not in nit_each:
            nit_each.append(2 ** exp_cubic)
        if 2 ** exp_quartic not in nit_each:
            nit_each.append(2 ** exp_quartic)
        if 2 ** 16 not in nit_each:
            nit_each.append(2 ** 16)
        if 2 ** 19 not in nit_each:
            nit_each.append(2 ** 19)
        exp_cubic += 2
        exp_quartic += 3
        n_it_l.append(nit_each)

    n_list = list(map(lambda x: 2 ** x, exp_n_list))

    read_all(k, n_list, alpha_list, n_it_l)

    return 0


if __name__ == '__main__':
    main()
