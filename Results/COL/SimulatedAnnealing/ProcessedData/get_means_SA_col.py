__author__ = 'david'

import numpy as np

def read_all(q, n_list, c_list, a_list):
    fout_name = f'./Results/q_{q}/SA_col_all_q_{q}.txt'
    fout = open(fout_name, "w")
    fout.write("#  N   c   nIter  av(e)   err(e)   P(sol)  runtime   std(runtime)    nsamples\n")
    for j in range(len(n_list)):
        n = n_list[j]
        for a in a_list:
            for c in c_list:
                fin_name = "./Results/q_" + str(q) + "/AllData/SA_col_N_" + str(n) + "_q_" + str(q) + "_c_" + \
                            str(c) + "_A_" + str(a) + ".txt"
                try:
                    fin = open(fin_name, "r")
                    
                    fin.readline()
                    line = fin.readline().split()
                    nsampl = int(line[3].split("=")[1])
                    line = fin.readline().split()
                    av_e = float(line[1])
                    line = fin.readline().split()
                    err_e = float(line[1])
                    line = fin.readline().split()
                    av_t = float(line[1])
                    line = fin.readline().split()
                    err_t = float(line[1])

                    counter = 0
                    for _ in range(nsampl):
                        line = fin.readline().split()
                        if float(float(line[0]) < 0.5):
                            counter += 1
                    psol = counter / nsampl
                    fin.close()
                    nit = a * n
                    fout.write(str(n) + "\t" + str("{0:.2f}".format(c)) + "\t" + str(nit) + "\t" + str("{0:.3f}".format(av_e))
                            + "\t" + str("{0:.3f}".format(err_e)) + "\t" + str("{0:.3f}".format(psol)) + "\t" 
                            + str("{0:.3f}".format(av_t)) + "\t" + str("{0:.3f}".format(err_t)) + "\t" + str(nsampl) + "\n")
                except(OSError, IOError):
                    print(fin_name + "  not read")
                    continue
    fout.close()


def main():
    exp_n_list = [11, 12, 13, 14, 15, 16, 17]
    q = 5
    c_list = np.unique([3.1, 3.3, 3.5, 3.7, 3.9, 4.1, 4.3, 4.5,
                        3.5, 3.6, 3.7, 3.8, 3.9, 4.0, 4.1, 4.2, 4.3,
                        3.75, 3.85, 3.95, 4.05, 4.15, 4.25, 4.35, 4.45,
                        11.15, 11.3, 11.45, 11.6, 11.75, 11.9, 12.05, 12.2,
                        11.8, 11.9, 12.0, 12.1, 12.2, 12.3, 12.4, 12.5,
                        12.35, 12.4, 12.45, 12.5, 12.55, 12.6, 12.65, 12.7, 12.75, 12.8])
    a_list = [10, 100, 1000]

    n_list = list(map(lambda x: 2 ** x, exp_n_list))

    read_all(q, n_list, c_list, a_list)

    return 0


if __name__ == '__main__':
    main()
