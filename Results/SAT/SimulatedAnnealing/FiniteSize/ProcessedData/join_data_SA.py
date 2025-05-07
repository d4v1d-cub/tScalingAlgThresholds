__author__ = 'david'


def join_data(n_bound, nsampl_bound, ffede_name, k, max_iters):
    fout_name = "./Results/K_" + str(k) + "/AllMeansToPlot_K_" + str(k) + "_maxIt_" + str(max_iters) + ".txt"
    fout = open(fout_name, "w")
    fout.write("#  alpha   N   av(log(t))   std((log(t)))   nsampl\n")

    try:
        ffede = open(ffede_name, "r")
        while True:
            j = ffede.readline()
            if not j:
                break
            line = j.split()
            alpha = float(line[0])
            n = int(line[1])
            av_logt = line[2]
            err_logt = line[3]
            nsampl = int(line[4])
            if n >= n_bound and nsampl >= nsampl_bound and alpha < 3.8:
                fout.write(str(alpha) + "\t" + str(n) + "\t" + av_logt + "\t" + err_logt +
                           "\t" + str(nsampl) + "\n")
        ffede.close()
    except(OSError, IOError):
        print(ffede_name + "  not read")

    fcluster_name = "./Results/K_" + str(k) + "/Quenched_T0_KSAT_all_K_" + str(k) + "_maxIt_" + str(max_iters) + ".txt"

    try:
        fcluster = open(fcluster_name, "r")
        fcluster.readline()
        while True:
            j = fcluster.readline()
            if not j:
                break
            line = j.split()
            alpha = line[1]
            n = int(line[0])
            av_logt = line[3]
            err_logt = line[4]
            nsampl = int(line[2])
            if n >= n_bound and nsampl >= nsampl_bound:
                fout.write(alpha + "\t" + str(n) + "\t" + av_logt + "\t" + err_logt +
                           "\t" + str(nsampl) + "\n")
        fcluster.close()
    except(OSError, IOError):
        print(ffede_name + "  not read")

    fout.close()


def main():
    n_bound = 102400
    nsampl_bound = 200
    k = 3
    max_iters = 2000000

    ffede_name = "../allAlpha"

    join_data(n_bound, nsampl_bound, ffede_name, k, max_iters)

    return 0


if __name__ == '__main__':
    main()
