__author__ = 'david'

import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit


def read_crossings(path_to_crossings, string1, exponents):
    crossings = []
    for exponent in exponents: 
        inner = []
        filename = f'{path_to_crossings}/{string1}{exponent}.txt'
        fin = open(filename, "r")
        while True:
            j = fin.readline()
            if not j:
                break
            line = j.split()
            inner.append([float(line[0]), float(line[2]), float(line[3]), float(line[4]), float(line[5])])
        crossings.append(np.array(inner))
        fin.close()
    return crossings



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


def make_all_fit(crossings, xvals):
    par_list = []
    err_list = []
    av_cost = 0.0
    par_log_list = []
    err_log_list = []
    av_cost_log = 0.0
    for i in range(len(crossings)):
        params, errors, cost, params_log, errors_log, cost_log = make_fit(crossings[i], xvals[i])
        par_list.append(params)
        err_list.append(errors)
        av_cost += cost
        par_log_list.append(params_log)
        err_log_list.append(errors_log)
        av_cost_log += cost_log
    av_cost /= len(crossings)
    av_cost_log /= len(crossings)
    return par_list, err_list, av_cost, par_log_list, err_log_list, av_cost_log


def try_several_gamma(gamma_list, crossings, path_out, fname, fname_log):
    fout = open(f'{path_out}/{fname}', "w")
    fout_log = open(f'{path_out}/{fname_log}', "w")
    fout.write("# gamma  best_cost  params, errors...\n")
    fout_log.write("# gamma  best_cost  params, errors...\n")
    cost_list = []
    cost_log_list = []
    for gamma in gamma_list:
        xvals = []
        for i in range(len(crossings)):
            xvals.append(list(map(lambda n: n ** (-gamma), crossings[i][:, 0])))
        par_list, err_list, av_cost, par_log_list, err_log_list, av_cost_log = make_all_fit(crossings, xvals)
        cost_list.append(av_cost)
        cost_log_list.append(av_cost_log)
        fout.write(f'{"{0:.4f}".format(gamma)}\t{av_cost}')
        fout_log.write(f'{"{0:.4f}".format(gamma)}\t{av_cost_log}')
        for i in range(len(par_list)):
            for j in range(len(par_list[i])):
                fout.write(f'\t{par_list[i][j]}\t{err_list[i][j]}')
                fout_log.write(f'\t{par_log_list[i][j]}\t{err_log_list[i][j]}')
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
    exponents = ["-2", "+3"]
    
    gamma_list = np.arange(gamma_min, gamma_max, step=d_gamma)

    path_to_crossings = '/media/david/Data/UH/Grupo_de_investigacion/Estudiantes/Martín/Maestría/Federico_code/SA/Results/K_4'
    string1 = 'crossings_K_4_squared_a_2to'
    fileout = f'fits_K_4_squared_simultaneous.txt'
    fileout_log = f'fits_K_4_squared_simultaneous_log.txt'
    fig_costs = f'Costs_fits_K_4_squared_simultaneous.png'
    fig_costs_log = f'Costs_fits_K_4_squared_simultaneous_log.png'

    crossings = read_crossings(path_to_crossings, string1, exponents)
    cost_list, cost_log_list = try_several_gamma(gamma_list, crossings, path_to_crossings, fileout, fileout_log)
    plot_costs(gamma_list, cost_list, path_to_crossings, fig_costs)
    plot_costs(gamma_list, cost_log_list, path_to_crossings, fig_costs_log)

    return 0


if __name__ == '__main__':
    main()
