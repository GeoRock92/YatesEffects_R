# YatesEffects_R
A small script in R to calculate Yates effects using pre-existing packages

The code in this repository was used during my PhD to systematically analyse Yates effects in large 2^n unreplicated factorial experiments of geological nature. The code is written in R and it represents a fast way to identify influencing factors and combination of factors in data. 

The script merely takes exsisting packages (reardr, dae and BsMD; Brien, 2020; Barrios and Meyer, 2020) and uses their functions to quickly analyse Yates effects in a graphical way. The script can be easily adapted to perform batch analyses. 

***Background***

Yates analysis is a mathematical procedure to analyse data obtained from two-level factorial experiments (Box et al. 1978). In a two-level factorial experiment, a number (n) of input variables (which are often referred to as factors) are each assigned two possible values (Box et al. 1978). In a full-factorial experiment, models are constructed using all possible combinations of both levels or all factors, resulting in 2^n models. 

Yates analysis assesses the importance of input factors and their combinations on the variability of a certain output variable. The analysis ranks the input factors and combinations of factors from more influential on the output to less influential by calculating the so-called Yates effects (also commonly known as main effects, Box et al. 1978). Yates effects can be defined as the difference between the output means for the cases that include the high and low levels of the factors (Box et al. 1978). Therefore, if a factor does not produce any change on output data, the effect will be close to zero because it results from the difference in averages of random data (Box et al. 1978). Following the convention defined by Box et al. (1978), Yates effects are expressed as their absolute value and hence have the same units as the parameter they refer to.

Yates effects are commonly identified using graphic tools; however, it can be hard to differentiate between significant and insignificant effects for larger lists of input factors (e.g. QQ plots). The solution adopted with this code is by using the approach of Lenth (Lenth, 1989). Lenth plots are similar to Tornado plots used in other studies when the Yates analysis is performed (e.g. Manzocchi and Childs, 2013), with the addition of robust estimates of two standard errors: the marginal error (ME) and the simultaneous margin of error (SME; see Lenth, 1989 for details). According to Lenth (1989), effects which fall below ME have little evidence of having any influence on the output variable, effects which fall between ME and SME limits are described as possibly active, and those that have an effect larger than SME are probably active. 

***Practical example***

The following figure shows a Lenth plot for the original experiment of Box et al. (1978), in which the influence of three input factors (temperature, concentration and catalyst) was quantified in relation with the output variable (yield). Provided is the original dataset and the script.

The resulting plot shows the absolute effects for each input factor and their factor combinations and concludes that the variables Temperature and Concentration are the only active effects having a large influence on the output, yield. Although the use of SME and ME defines a quantitative boundary beyond which effects are not statistically significant, other effects can still be influential depending on the output variable and the interpreter criteria: for example, Catalyst has an effect of 5 units on the output yield which might be of practical importance. Hence, although SME and ME provide the analysis with a discrete limit, it is important to remember that they are not the absolute truth, but are a statistical tool to lead the analysis to where some degree of qualitative interpretation is allowed.

![Rplot](https://user-images.githubusercontent.com/17766787/121900723-a28fa280-cd1d-11eb-938f-7dffed6717ab.png)

***References***

Barrios, E. & Meyer, D. 2020. BsMD: Bayes Screening and Model Discrimination. R package version 2020.4.30. Available at: https://CRAN.R-project.org/package=BsMD
Box, G.P., Hunter, W.G. & Hunter, J.S. 1978. Statistics for experimenters. John Wiley, New York. 
Brien, C. 2020. Dae: Functions useful in the design and ANOVA of experiments. R Package version 3.1-27. Available at: https://CRAN.R-project.org/package=dae
Lenth, R.V. 1989. Quick and easy analysis of unreplicated factorials. Technometrics, 31, 469-473. doi: 10.2307/1269997.
Manzocchi, T. & Childs, C. 2013. Quantification of hydrodynamic effects on capillary seal capacity. Petroleum Geoscience, 19, 105–121. doi: 10.1144/petgeo2012-005.
