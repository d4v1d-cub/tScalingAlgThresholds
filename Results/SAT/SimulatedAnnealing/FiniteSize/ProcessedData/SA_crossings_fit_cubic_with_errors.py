__author__ = 'david'

import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit


def read_crossings(path_to_crossings, filein):
    crossings = []
    filename = f'{path_to_crossings}/{filein}'
    fin = open(filename, "r")
    while True:
        j = fin.readline()
        if not j:
            break
        line = j.split()
        crossings.append([float(line[0]), float(line[2]), float(line[3]), float(line[4]), float(line[5])])
    fin.close()
    return np.array(crossings)



def func_to_fit(x, alpha_SA, slope):
    return alpha_SA + slope * x


def make_fit(crossings_coef, xvals_coef):
    answ = curve_fit(func_to_fit, xvals_coef, crossings_coef[:, 1], sigma=crossings_coef[:, 2], absolute_sigma=True, full_output=True)
    params = answ[0]
    error_params = np.sqrt(np.diag(answ[1]))
    final_cost = np.sum(answ[2]['fvec'] ** 2) 
    answ_log = curve_fit(func_to_fit, xvals_coef, crossings_coef[:, 3], sigma=crossings_coef[:, 4], absolute_sigma=True, full_output=True)
    params_log = answ_log[0]
    error_params_log = np.sqrt(np.diag(answ_log[1]))
    final_cost_log = np.sum(answ_log[2]['fvec'] ** 2)

    return params, error_params, final_cost, params_log, error_params_log, final_cost_log


def try_several_gamma(gamma_list, crossings, path_out, fname, fname_log):
    fout = open(f'{path_out}/{fname}', "w")
    fout_log = open(f'{path_out}/{fname_log}', "w")
    fout.write("# gamma  best_cost  params, errors...\n")
    fout_log.write("# gamma  best_cost  params, errors...\n")
    cost_list = []
    cost_log_list = []
    for gamma in gamma_list:
        xvals = list(map(lambda n: n ** (-gamma), crossings[:, 0]))
        par, err, cost, par_log, err_log, cost_log = make_fit(crossings, xvals)
        cost_list.append(cost)
        cost_log_list.append(cost_log)
        fout.write(f'{"{0:.4f}".format(gamma)}\t{cost}')
        fout_log.write(f'{"{0:.4f}".format(gamma)}\t{cost_log}')
        for i in range(len(par)):
            fout.write(f'\t{par[i]}\t{err[i]}')
            fout_log.write(f'\t{par_log[i]}\t{err_log[i]}')
        fout.write('\n')
        fout_log.write('\n')
    fout.close()
    fout_log.close()
    return cost_list, cost_log_list


def plot_costs(gamma_list, best_cost_list, path_to_fig, fig_name):
    plt.plot(gamma_list, best_cost_list, linewidth=2, color='red')
    plt.xlabel(r'$\gamma$')
    plt.ylabel("sum of squares")
    plt.legend(loc='best')
    plt.grid()
    plt.savefig(f'{path_to_fig}/{fig_name}')
    plt.show()

def main():
    gamma_min = 0.01
    gamma_max = 1.5
    d_gamma = 0.0001
    
    gamma_list = np.arange(gamma_min, gamma_max, step=d_gamma)

    path_to_crossings = '/media/david/Data/UH/Grupo_de_investigacion/Estudiantes/Martín/Maestría/Federico_code/SA/Results/K_4'
    filein = 'crossings_K_4_cubic.txt'
    fileout = f'fits_K_4_cubic.txt'
    fileout_log = f'fits_K_4_cubic_log.txt'
    fig_costs = f'Costs_fits_K_4_cubic.png'
    fig_costs_log = f'Costs_fits_K_4_cubic_log.png'

    crossings = read_crossings(path_to_crossings, filein)
    cost_list, cost_log_list = try_several_gamma(gamma_list, crossings, path_to_crossings, fileout, fileout_log)
    plot_costs(gamma_list, cost_list, path_to_crossings, fig_costs)
    plot_costs(gamma_list, cost_log_list, path_to_crossings, fig_costs_log)

    return 0


if __name__ == '__main__':
    main()
