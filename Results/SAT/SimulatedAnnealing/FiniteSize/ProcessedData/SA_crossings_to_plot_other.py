__author__ = 'david'

import numpy as np


def read_data(path_to_data, filefits):
    data = []
    fin = open(f'{path_to_data}/{filefits}', "r")
    fin.readline()
    while True:
        j = fin.readline()
        if not j:
            break
        line = j.split()
        data.append(list(map(float, line)))
    data = np.array(data)
    fin.close()
    return data


def get_info_pos(data, pos, npars, deg_freedom):
    gamma = data[pos, 0]
    chi_sqr = data[pos, 1] / deg_freedom
    pars_min = []
    for i in range(0, npars, 2):
        inner = []
        for j in range(4):
            inner.append(data[pos, 2 + 2 * i + j])
        pars_min.append(inner)
    return gamma, chi_sqr, pars_min


def find_extreme_pos(chi_sqr_list, chi_sqr_min, thr, direction, pos_min):
    pos_try = pos_min + direction
    while chi_sqr_list[pos_try] - chi_sqr_min < thr:
        pos_try += direction
    return pos_try


def find_zero_pos(alpha_sa_1, alpha_sa_2):
    diff = alpha_sa_2 - alpha_sa_1
    cond = True
    i = 0
    while i < len(diff) and cond:
        if diff[i] * diff[i + 1] < 0:
            cond = False
        else:
            i += 1
    return i


def get_fits(path_to_data, filefits, thr, npars, npoints):
    deg_freedom = npoints - npars
    data = read_data(path_to_data, filefits)
    pos_min = np.argmin(data[:, 1])
    gamma_min, chi_sqr_min, pars_min = get_info_pos(data, pos_min, npars, 
                                                    deg_freedom)
    chi_sqr_list = data[:, 1] / deg_freedom
    
    pos_left = find_extreme_pos(chi_sqr_list, chi_sqr_min, thr, -1, pos_min)
    gamma_left, chi_sqr_left, pars_left = get_info_pos(data, pos_left, npars, 
                                                       deg_freedom)
    
    pos_right = find_extreme_pos(chi_sqr_list, chi_sqr_min, thr, 1, pos_min)
    gamma_right, chi_sqr_right, pars_right = get_info_pos(data, pos_right, npars, 
                                                          deg_freedom)

    print("chi_sqr:", chi_sqr_left, chi_sqr_min, chi_sqr_right)
    print("gamma:", gamma_left, gamma_min, gamma_right)
    return gamma_min, [gamma_left, gamma_right], pars_min, [pars_left, pars_right]



def func_to_fit(x, alpha_SA, slope):
    return alpha_SA + slope * x



def export_data(min_n, params_min, params_list, gamma_min, gamma_list, 
                path_to_data, fileout, ncurves, nsamples):
    fout = open(f'{path_to_data}/{fileout}', "w")
    yvals = np.zeros((len(gamma_list) + 2, ncurves, nsamples))
    max_x = min_n ** (-gamma_min)
    xvals = np.linspace(0, max_x, nsamples)
    for i in range(ncurves):
        for j in range(nsamples):
            yvals[0, i, j] = func_to_fit(xvals[j], params_min[i][0], params_min[i][2])
    for g in range(len(gamma_list)):
        fraction =  gamma_list[g] / gamma_min
        xvals_trans = xvals ** fraction
        for i in range(ncurves):
            for j in range(nsamples):
                yvals[g + 1, i, j] = func_to_fit(xvals_trans[j], params_list[g][i][0], params_list[g][i][2])

    for j in range(nsamples):
        fout.write(str("{0:.6f}".format(xvals[j])))
        for g in range(len(gamma_list) + 1):
            for i in range(ncurves):
                fout.write("\t" + str("{0:.6f}".format(yvals[g, i, j])))
        fout.write("\n")
    fout.close()


def main():
    min_n = 4096
    thr = 1
    nsamples = 1000

    path_to_data = '/media/david/Data/UH/Grupo_de_investigacion/Estudiantes/Martín/Maestría/Federico_code/SA/Results/K_4'

    filedata = f'fits_K_4_cubic.txt'
    fileout = f'data_to_plot_fits_cubic.txt'
    npoints = 5
    npars = 2
    ncurves = 1


    # filedata = f'fits_K_4_quartic.txt'
    # fileout = f'data_to_plot_fits_quartic.txt'
    # npoints = 3
    # npars = 2
    # ncurves = 1


    gamma_min, gamma_list, params_min, params_list = \
    get_fits(path_to_data, filedata, thr, npars, npoints)


    export_data(min_n, params_min, params_list, gamma_min, gamma_list, 
                path_to_data, fileout, ncurves, nsamples)

    return 0


if __name__ == '__main__':
    main()
