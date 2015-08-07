# Reproducible research: An introduction to [knitr](http://yihui.name/knitr/)

A workshop presented by	[Sahir Bhatnagar](http://sahirbhatnagar.com/) (McGill University)
  
**Date**: Thursday,	May 28, 2015, 13:00-­‐16:00  
**Location**: Purvis Hall, Room 25, McGill University  
**Slides**: The slides used for this presentation can be found [here](https://github.com/sahirbhatnagar/knitr-tutorial/blob/master/slides/mcgill-knitr.pdf)

Sponsored by the CRM Statistics	Laboratory and the Montreal Biostatistics Seminar Series

----

**Description**: With the ever increasing size of data and complexity of methods required to analyze them, the reproducibility of results is necessary to ensure a high quality of scientific research. In this workshop, we will discuss the main concepts and motivations for reproducible research (RR). Mr. Bhatnagar will then introduce useful tools for RR, including [RStudio](http://www.rstudio.com/), [knitr](http://yihui.name/knitr/), and [Markdown](http://daringfireball.net/projects/markdown/syntax). We will work through several examples to see how these tools can be used to perform efficiently common tasks such as writing reports, Beamer presentations, running simulations, repetitive function calls that require single or multiple inputs to be changed, and sharing results. Basic knowledge of `R` and `LaTeX` is assumed. 

Participants must bring their own laptops, with the following programs and packages installed:

* [R](http://cran.r-project.org/)
* [RStudio v0.99.441 Preview](http://www.rstudio.com/products/rstudio/download/preview/)
* `R` packages `knitr`, `magrittr`, `data.table`, `ggplot2`, `devtools`
* A working instance of `LaTeX`
* [TeXStudio (optional)](http://texstudio.sourceforge.net/)


----

## Reproducible Examples

All the examples in this repository are reproducible. To compile please follow these instructions:

1. For a given directory, open the associated `.Rproj` file in RStudio
2. Open the `.Rnw` corresponding to the name of the folder
3. In RStudio, make sure files are weaved using `knitr` (Tools -> Global Options -> Sweave -> Weave .Rnw files using: select knitr in the dropdown menu)
4. In RStudio, click on `Compile PDF` or in the `R` console enter `knitr::knit2pdf("*.Rnw")` where * is the name of the `.Rnw` to compile

----

## How Does it work?

* In each of the folders there is a `packages.R` file, which automatically tests for required packages, and install them if they are missing from your library
* There is no need to set any working directories, since you have opened the `.Rproj` file
* To be able to compile the [slides](https://github.com/sahirbhatnagar/knitr-tutorial/tree/master/slides), you need to have a Perl interpreter installed. If you do not have one, simply comment out `knit_hooks$set(crop = hook_pdfcrop)` in the setup chunk of the [`mcgill-knitr.Rnw`](https://github.com/sahirbhatnagar/knitr-tutorial/blob/master/slides/mcgill-knitr.Rnw) file




----

## References

### Books

* [Reproducible research with R and RStudio](http://www.amazon.com/exec/obidos/ASIN/1466572841/7210-20)
* [Dynamic documents with R and knitr](http://www.amazon.com/exec/obidos/ASIN/1482203537/7210-20)


### Websites

* [CRAN Reproducible Research Task View](http://cran.r-project.org/web/views/ReproducibleResearch.html)
* [knitr chunk options](http://yihui.name/knitr/options/)
* [&Eacute;laboration et conversion de documents avec Markdown et Pandoc](http://enacit1.epfl.ch/markdown-pandoc/)
* [Vanderbilt University](http://biostat.mc.vanderbilt.edu/wiki/Main/KnitrHowto)
* [Jennifer Bryan (UBC)](https://github.com/jennybc/2015-02-23_bryan-fields-talk)
* [Data Science with R by Graham Williams](http://handsondatascience.com/KnitRO.pdf)
* [knitr showcase](http://yihui.name/knitr/demo/showcase/)
* [Karl Broman's Tools for RR](http://kbroman.org/Tools4RR/)
* [Editors for knitr](http://yihui.name/knitr/demo/editors/)
* [What is an R-Project?](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects)

----

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>
