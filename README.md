# wrfout-ncl

This repository serves as an "library" for plotting various parameters in the output of Weather Research and Forecast (WRF) model. It used module approach so as to reduce the time on making consistent configuration, as well as creating more readible code.

# Requirement:
  NCL 6.3.0
  
# Background:

Before getting started, first you need to understand the file naming. Files with prefix <i>"module"</i> are configuration files. There are four important types of module files.
- <b>module_input_single.ncl</b> is responsible for selecting a <b>single wrfout</b> for NCL to plot.
- <b>module_input_multi.ncl</b> is responsible for selecting <b>multiples wrfout</b> for NCL to plot.
- <b>module_basemap_mpres.ncl</b> is responsible for configuring the geographic information.
- <b>module_(plot_type)_(parameters_name).ncl</b> are responsible for plotting "parameters_name" from wrfout in the "plot_type" style with colormap defined inside.


Moreover, files with prefix <i>"plot"</i> are responsible for the data processing of parameters, as well as label of the plot.

These plot files may have suffix <b>"single"</b> or <b>"multi"</b>, which means they use <b>module_input_single.ncl</b> (for reading a single wrfout file) or <b>module_input_multi.ncl</b> (for reading multiple wrfout files) respectively.

# How to use:
1. Check out which plot file you have to use.
2. Open the plot file using editor.
3. Check whether the correct setting are made by in module files according to "loadscript" section. E.g. Selecting correct wrfout.
4. If it is all correct, use NCL command to plot.

# Problems?
Please let me know if there are any bugs/wrong setting. I will try to fix ASAP.
