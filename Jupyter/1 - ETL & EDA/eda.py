import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

from IPython.display import display, HTML


def display_dict(m, precision = 3):
    table = "<table>"
    for item in m.items():
        table += ("<tr><th>{0}</th><td>{1:." + str(precision) + "f}</td></tr>").format(*item)
    table += "</table>"
    return display(HTML(table))

def calculate_tukey_five(data):
    values = list(np.concatenate([[np.min(data)], stats.mstats.mquantiles( data, [0.25, 0.5, 0.75]),[np.max(data)]]))
    labels = ["Min", "Q1", "Median", "Q3", "Max"]
    data = {"Stats": labels, "Values": values}
    return data

def calculate_tukey_dispersion(five):
    _five = {k: v for k, v in zip(five["Stats"], five["Values"])}
    labels = ["Range", "IQR", "QCV"]
    values = [
        _five["Max"] - _five["Min"],
        _five["Q3"] - _five["Q1"],
        (_five["Q3"] - _five["Q1"]) / _five["Median"]
    ]
    return {"Stats": labels, "Values": values}

def tukey(data):
    five = calculate_tukey_five(data)
    dispersion = calculate_tukey_dispersion(five)
    return {"Stats": five["Stats"] + dispersion["Stats"], "Values": five["Values"] + dispersion["Values"]}

def freeman_diaconis( data):
    quartiles = stats.mstats.mquantiles( data, [0.25, 0.5, 0.75])
    iqr = quartiles[2] - quartiles[ 0]
    n = len( data)
    h = 2.0 * (iqr/n**(1.0/3.0))
    return int(np.ceil( h))

def restyle_boxplot(patch):
    ## change color and linewidth of the whiskers
    for whisker in patch['whiskers']:
        whisker.set(color='#000000', linewidth=1)

    ## change color and linewidth of the caps
    for cap in patch['caps']:
        cap.set(color='#000000', linewidth=1)

    ## change color and linewidth of the medians
    for median in patch['medians']:
        median.set(color='#000000', linewidth=2)

    ## change the style of fliers and their fill
    for flier in patch['fliers']:
        flier.set(marker='o', color='#000000', alpha=0.2)

    for box in patch["boxes"]:
        box.set( facecolor='#FFFFFF', alpha=0.5)

        
def single_categorical(data):
    counts = data.value_counts().sort_index()
    proportions = data.value_counts(normalize=True).sort_index()
    result = pd.concat([counts, proportions], axis=1)
    result.columns = ["counts", "proportions"]
    return pd.DataFrame(result)

def two_categorical(data, X, Y):
    counts = pd.crosstab(data[X], data[Y])
    freq = pd.crosstab( data[X], data[Y]).apply(lambda r: r/len(data), axis=1)
    return counts, freq

# Numerical vs Categorical
def describe_by_category(data, numeric, categorical, transpose=False):
    grouped = data.groupby(categorical)
    grouped_y = grouped[numeric].describe()
    if transpose:
        return pd.DataFrame(grouped_y.transpose())
    else:
        return pd.DataFrame(grouped_y)


def correlate(x1, x2):
    print("r   = ", stats.pearsonr( x1, x2)[0])
    print("rho = ", stats.spearmanr( x1, x2)[0])

# Numerical vs Categorical
def multiboxplot(data, numeric, categorical, skip_data_points=True):
    figure = plt.figure(figsize=(14, 6))

    axes = figure.add_subplot(1, 1, 1)

    grouped = data.groupby(categorical)
    labels = pd.unique(data[categorical].values)
    labels.sort()
    grouped_data = [grouped[numeric].get_group( k) for k in labels]
    patch = axes.boxplot( grouped_data, labels=labels, patch_artist=True, zorder=1)

    if not skip_data_points:
        for i, k in enumerate(labels):
            subdata = grouped[numeric].get_group( k)
            x = np.random.normal(i + 1, 0.01, size=len(subdata))
            axes.plot(x, subdata, 'o', alpha=0.4, color="DimGray", zorder=2)

    axes.set_xlabel(categorical)
    axes.set_ylabel(numeric)
    axes.set_title("Distribution of {0} by {1}".format(numeric, categorical))

    plt.show()
    plt.close()

# Numerical vs Numerical
def lowess_scatter(data, x, y, jitter=0.0, skip_lowess=False):

    if skip_lowess:
        fit = np.polyfit(data[x], data[y], 1)
        line_x = np.linspace(data[x].min(), data[x].max(), 10)
        line = np.poly1d(fit)
        line_y = list(map(line, line_x))
    else:
        lowess = sm.nonparametric.lowess(data[y], data[x], frac=.3)
        line_x = list(zip(*lowess))[0]
        line_y = list(zip(*lowess))[1]

    figure = plt.figure(figsize=(10, 6))

    axes = figure.add_subplot(1, 1, 1)

    xs = data[x]
    if jitter > 0.0:
        xs = data[x] + stats.norm.rvs( 0, 0.5, data[x].size)

    axes.scatter(xs, data[y], marker="o", color="DimGray", alpha=0.5)
    axes.plot(line_x, line_y, color="DarkRed")

    title = "Plot of {0} v. {1}".format(x, y)
    if not skip_lowess:
        title += " with LOWESS"
    axes.set_title(title)
    axes.set_xlabel(x)
    axes.set_ylabel(y)

    plt.show()
    plt.close()