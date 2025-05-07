__author__ = 'david'

import numpy as np
from scipy.optimize import curve_fit
import pandas as pd


def scaling(n, coef, exponent):
    return int(round(coef * n ** (exponent - 1)))


def read_data(path_to_data, filename, scaling_func):
    data = []
    fin = open(f'{path_to_data}/{filename}', "r")
    fin.readline()
    while True:
        j = fin.readline()
        if not j:
            break
        line = j.split()
        n = int(line[0])
        n_iter = int(line[2])
        if scaling_func(n) == n_iter:
            data.append([n, float(line[1]), n_iter, float(line[3]), float(line[4])])
    fin.close()
    df = pd.DataFrame(data, columns=['N', 'alpha', 'NIter', 'E', 'error'])

    return df


def identify_crossings(df, n1, n2):
    df_n1 = df[df['N'] == n1]
    df_n2 = df[df['N'] == n2]
    alphas_n1 = df_n1['alpha'].to_numpy()
    alphas_n2 = df_n2['alpha'].to_numpy()
    prev_pair = (0, 0)
    last_alpha = alphas_n1[0]
    for i in range(len(alphas_n1)):
        alpha = alphas_n1[i]
        cond = alpha in alphas_n2
        if cond:
            e1 = df_n1[df_n1['alpha'] == alpha]['E'].iloc[0]
            e2 = df_n2[df_n2['alpha'] == alpha]['E'].iloc[0]
            new_pair = (e1, e2)
            if (new_pair[1] - new_pair[0]) * (prev_pair[1] - prev_pair[0]) < 0:
                err1_1 = df_n1[df_n1['alpha'] == last_alpha]['error'].iloc[0]
                err1_2 = df_n2[df_n2['alpha'] == last_alpha]['error'].iloc[0]
                err2_1 = df_n1[df_n1['alpha'] == alpha]['error'].iloc[0]
                err2_2 = df_n2[df_n2['alpha'] == alpha]['error'].iloc[0]
                y1 = prev_pair[1] - prev_pair[0]
                y2 = new_pair[1] - new_pair[0]
                d_y1 = np.sqrt(err1_1 ** 2 + err1_2 ** 2)
                d_y2 = np.sqrt(err2_1 ** 2 + err2_2 ** 2)

                y1_log = np.log(prev_pair[1]) - np.log(prev_pair[0])
                y2_log = np.log(new_pair[1]) - np.log(new_pair[0])
                err1_1_log = err1_1 / prev_pair[0]
                err1_2_log = err1_2 / prev_pair[1]
                err2_1_log = err2_1 / new_pair[0]
                err2_2_log = err2_2 / new_pair[1]
                d_y1_log = np.sqrt(err1_1_log ** 2 + err1_2_log ** 2)
                d_y2_log = np.sqrt(err2_1_log ** 2 + err2_2_log ** 2)

                return (last_alpha, alpha), (y1, y2), \
                       (d_y1, d_y2), (y1_log, y2_log), (d_y1_log, d_y2_log)
            else:
                prev_pair = new_pair
                last_alpha = alpha
    print(f'Crossing not found for N1={n1} and N2={n2}')
    return (), (), (), (), ()


def linear_function(x, zero, slope):
    return slope * (x - zero)


def linear_function_indirect(x, intercept, slope):
    return slope * x + intercept


def zero_and_error(params, std_params, x0):
    intercept, slope = params
    err_inter, err_slope = std_params
    zero = -intercept / slope + x0
    err_zero = np.abs(-intercept / slope) * np.sqrt((err_inter / intercept) ** 2 + (err_slope / slope) ** 2)
    return zero, err_zero


def comp_crossings(path_to_data, filename, scaling_function, fileout):
    fout = open(f'{path_to_data}/{fileout}', "w")
    df = read_data(path_to_data, filename, scaling_function)
    n_vals = df['N'].unique()
    for i in range(len(n_vals) - 1):
        x, y, y_err, y_log, y_err_log = identify_crossings(df, n_vals[i], n_vals[i + 1])
        if len(x) > 0:
            params, pcov = curve_fit(linear_function, x, y, sigma=y_err, absolute_sigma=True)
            zero, err_zero = params[0], np.sqrt(pcov[0][0])
            params_log, pcov_log = curve_fit(linear_function, x, y_log, sigma=y_err_log, absolute_sigma=True)
            zero_log, error_zero_log = params_log[0], np.sqrt(pcov_log[0][0])
            fout.write(f'{n_vals[i]}\t{n_vals[i + 1]}\t{zero}\t{err_zero}\t{zero_log}\t{error_zero_log}\n')
            print(n_vals[i], n_vals[i + 1], zero, err_zero, zero_log, error_zero_log)
    fout.close()


def comp_crossings_indirect(path_to_data, filename, scaling_function, fileout):
    fout = open(f'{path_to_data}/{fileout}', "w")
    df = read_data(path_to_data, filename, scaling_function)
    n_vals = df['N'].unique()
    for i in range(len(n_vals) - 1):
        x, y, y_err, y_log, y_err_log = identify_crossings(df, n_vals[i], n_vals[i + 1])
        if len(x) > 0:
            x_2_fit = x - x[0]
            params, pcov = curve_fit(linear_function_indirect, x_2_fit, y, sigma=y_err, absolute_sigma=True)
            zero, err_zero = zero_and_error(params, np.sqrt(np.diag(pcov)), x[0])
            params_log, pcov_log = curve_fit(linear_function_indirect, x_2_fit, y_log, sigma=y_err_log, absolute_sigma=True)
            zero_log, error_zero_log = zero_and_error(params_log, np.sqrt(np.diag(pcov_log)), x[0])
            fout.write(f'{n_vals[i]}\t{n_vals[i + 1]}\t{zero}\t{err_zero}\t{zero_log}\t{error_zero_log}\n')
            print(n_vals[i], n_vals[i + 1], zero, err_zero, zero_log, error_zero_log)
    fout.close()


def main():
    path_to_data = '/media/david/Data/UH/Grupo_de_investigacion/Estudiantes/Martín/Maestría/Federico_code/SA/Results/K_4'
    filename = 'SA_KSAT_all_K_4.txt'

    # coef = 1/4
    # exponent = 2
    # fileout = "crossings_K_4_squared_a_2to-2.txt"
    # fileout_indirect = "crossings_K_4_squared_a_2to-2_indirect.txt"

    # coef = 8
    # exponent = 2
    # fileout = "crossings_K_4_squared_a_2to+3.txt"
    # fileout_indirect = "crossings_K_4_squared_a_2to+3_indirect.txt"

    coef = 2 ** (-16)
    exponent = 3
    fileout = "crossings_K_4_cubic.txt"
    fileout_indirect = "crossings_K_4_cubic_indirect.txt"

    # coef = 2 ** (-29)
    # exponent = 4
    # fileout = "crossings_K_4_quartic.txt"
    # fileout_indirect = "crossings_K_4_quartic_indirect.txt"

    sc_f = lambda x: scaling(x, coef, exponent)

    comp_crossings(path_to_data, filename, sc_f, fileout)
    
    comp_crossings_indirect(path_to_data, filename, sc_f, fileout_indirect)


    return 0


if __name__ == '__main__':
    main()
