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


def get_fits(path_to_data, filefits, npars, npoints):
    deg_freedom = npoints - npars
    data = read_data(path_to_data, filefits)
    pos_min = np.argmin(data[:, 1])
    gamma_min, chi_sqr_min, pars_min = get_info_pos(data, pos_min, npars, 
                                                    deg_freedom)

    alpha_sa_1 = data[:, 2]
    alpha_sa_2 = data[:, 6]
    pos = find_zero_pos(alpha_sa_1, alpha_sa_2)
    gamma, chi_sqr, pars = get_info_pos(data, pos, npars, deg_freedom)
    print("chi_sqr:", chi_sqr_min, chi_sqr)
    print("gamma:", gamma_min, gamma)
    return gamma_min, gamma, pars



def func_to_fit(x, alpha_SA, slope):
    return alpha_SA + slope * x



def export_data(min_n, gamma_min, params, gamma, path_to_data, fileout, ncurves, nsamples):
    fout = open(f'{path_to_data}/{fileout}', "w")
    yvals = np.zeros((ncurves, nsamples))
    max_x = min_n ** (-gamma_min)
    xvals = np.linspace(0, max_x, nsamples)
    fraction =  gamma / gamma_min
    xvals_trans = xvals ** fraction
    for i in range(ncurves):
        for j in range(nsamples):
            yvals[i, j] = func_to_fit(xvals_trans[j], params[i][0], params[i][2])
    
    for j in range(nsamples):
        fout.write(str("{0:.6f}".format(xvals[j])))
        for i in range(ncurves):
            fout.write("\t" + str("{0:.6f}".format(yvals[i, j])))
        fout.write("\n")
    fout.close()


def main():
    min_n = 4096
    thr = 1
    nsamples = 1000

    path_to_data = '/media/david/Data/UH/Grupo_de_investigacion/Estudiantes/Martín/Maestría/Federico_code/SA/Results/K_4'
    
    filedata = f'fits_K_4_squared_simultaneous.txt'
    fileout = f'data_to_plot_fits_squared_simultaneous_intercept_crossing.txt'
    npoints = 9
    npars = 4
    ncurves = 2


    gamma_min, gamma, params = get_fits(path_to_data, filedata, npars, npoints)


    export_data(min_n, gamma_min, params, gamma, path_to_data, 
                fileout, ncurves, nsamples)

    return 0


if __name__ == '__main__':
    main()
