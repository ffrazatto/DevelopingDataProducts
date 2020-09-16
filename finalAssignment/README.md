# Simple Data Explorer App

## Description

This application provides a simple and quick way for exploring the mtcars data set, 
allowing the user to plot a scatter plot, choose the x and y axes variables, 
group the data by another variable, while plotting a regression line 
(displaying its equation) and a simple residue plot.

## Pitch Presentation

A quick 5-slide pich presentation can be accessed with this link: 

[ffrazatto.github.io/DevelopingDataProducts/finalAssignment/pitchPresentation.html](ffrazatto.github.io/DevelopingDataProducts/finalAssignment/pitchPresentation.html)

## User Inputs

Based on the data set *mtcars*, the user can plot different graphs by simply choosing 
the axes variables. All variables options come from the *mtcars* data set, so when
in doubt use the r command `?mtcars`.

Inputs:

- x Axis
- y Axis
- Grouping Variable
- Toggle "group as discrete" option

## App Outputs

The app reads the x and y axes inputs and plot its scatter plot. 
Simultaneously, a simple one-regressor linear model is calculated
(with r's `lm` command). The resulting coefficients are shown in
the botton left corner of the screen alongside its `R^2` value.

The regression line is draw on the scatter plot and the 
residue vs scatter graph is also plotted.

Although the user can choose a "grouping" variable and toogle
it to be discrete or continuous, this are not taken into account
since it is a one-regressor linear model. This option is only
aesthetic, it aims at helping qualitatively evaluate if there are
clusters in the data that can be later explored.


All calculation are run at the 
[server.R](https://github.com/ffrazatto/DevelopingDataProducts/blob/master/finalAssignment/server.R) file,
and show on the webpage with the 
[ui.R](https://github.com/ffrazatto/DevelopingDataProducts/blob/master/finalAssignment/ui.R) file.
For more detailed information, please read them.


