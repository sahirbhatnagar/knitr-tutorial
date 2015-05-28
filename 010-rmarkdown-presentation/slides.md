# Imputing the epigenome
http://sahirbhatnagar.com/talks/  
March 12, 2015  




--- 

<div class="centered">
<img src="intro.png" alt="intro" style="width: 800px;"/>
</div>
[@epi]

## Main Idea {.emphasized}

<div class="red2", size="10">
Exploit the correlated nature of epigenetic signals, across both
marks and samples, for large-scale prediction of additional
datasets
</div>

## Matrix of Observed and Imputed Data

<div class="centered">
<img src="tablea.png" alt="tablea" style="width: 800px;"/>
</div>

## 1. Leverage other marks in same sample

<div class="centered">
<img src="cor1.png" alt="test" style="width: 850px;"/>
</div>

## 2. Leverage same mark in different sample

<div class="centered">
<img src="cor2.png" alt="test" style="width: 850px;"/>
</div>

## Types of data used to impute

<div class="centered">
<img src="used.png" alt="used" style="width: 500px;"/>
</div>


## Advantages of Imputation

> * Beneficial even if observed data is available
    + Combining information --> robust to experimental noise, confounders
    + Achieve a higher sequencing depth --> higher signal to noise ratio
> * Improve GWAS enrichments --> epigenomic maps as an unbiased approach for discovering disease-relevant tissues and cell types
> * Quality Control --> Are there discrepancies between imputed and observed datasets
> * Feature importance 
> * Chromatin state annotation

## Limitations

> -  If the presence of mark signal is highly specific to one or a
few samples, and it does not correlate with other marks mapped in the
sample or has a different correlation structure than in samples used for
training, then it would not be possible to accurately impute the mark at
those locations

> - When the target mark has been mapped in only a few
samples, the features pertaining to the same mark in other samples may
be less informative or more biased e.g. TFBS

> -  For tissue samples that reflect mixtures of
multiple cell types, our imputed maps will most likely reflect the same
mixture as the observed data, though deconvolution of mixed samples
is a potentially important direction for future work


## ChromImpute Software

<img src="chromimpute.png" alt="test" style="width: 900px;"/>

* Command line tool written in `JAVA`
* [http://www.biolchem.ucla.edu/labs/ernst/ChromImpute/](http://www.biolchem.ucla.edu/labs/ernst/ChromImpute/)


# Not a new idea

## Leo Breiman (1928-2005)

<img src="rf.png" alt="test" style="width: 600px;"/>

<img src="rf2.png" alt="test" style="width: 600px;"/>

[@rf]

[`randomForest` package in `R`](http://cran.r-project.org/package=randomForest)

## MissForest

<img src="peter.png" alt="test" style="width: 900px;"/>

[@peter]

[`missForest` package in `R`](http://cran.r-project.org/package=missForest)


# Introduction to Regression Trees

## Some intuition behind the imputation approach

<center><img src="linear.png" alt="test" style="width: 600px;"></center>

`total sales = 7.1 + 0.0475 x # of TV's sold`


## Tree-based Methods

* Involves _splitting_ the predictor space into simple regions
* Since the set of splitting rules used to segment the
predictor space can be summarized in a tree, these types of
approaches are known as decision-tree methods [@islr]

## Baseball Data

<!--html_preserve--><div id="htmlwidget-52" style="width:100%;height:auto;" class="datatables"></div>
<script type="application/json" data-for="htmlwidget-52">{ "x": {
 "data": [
 [ "-Andy Allanson", "-Alan Ashby", "-Alvin Davis", "-Andre Dawson", "-Andres Galarraga", "-Alfredo Griffin", "-Al Newman", "-Argenis Salazar", "-Andres Thomas", "-Andre Thornton", "-Alan Trammell", "-Alex Trevino", "-Andy VanSlyke", "-Alan Wiggins", "-Bill Almon", "-Billy Beane", "-Buddy Bell", "-Buddy Biancalana", "-Bruce Bochte", "-Bruce Bochy", "-Barry Bonds", "-Bobby Bonilla", "-Bob Boone", "-Bob Brenly", "-Bill Buckner", "-Brett Butler", "-Bob Dernier", "-Bo Diaz", "-Bill Doran", "-Brian Downing", "-Bobby Grich", "-Billy Hatcher", "-Bob Horner", "-Brook Jacoby", "-Bob Kearney", "-Bill Madlock", "-Bobby Meacham", "-Bob Melvin", "-Ben Oglivie", "-Bip Roberts", "-BillyJo Robidoux", "-Bill Russell", "-Billy Sample", "-Bill Schroeder", "-Butch Wynegar", "-Chris Bando", "-Chris Brown", "-Carmen Castillo", "-Cecil Cooper", "-Chili Davis", "-Carlton Fisk", "-Curt Ford", "-Cliff Johnson", "-Carney Lansford", "-Chet Lemon", "-Candy Maldonado", "-Carmelo Martinez", "-Charlie Moore", "-Craig Reynolds", "-Cal Ripken", "-Cory Snyder", "-Chris Speier", "-Curt Wilkerson", "-Dave Anderson", "-Doug Baker", "-Don Baylor", "-Dann Bilardello", "-Daryl Boston", "-Darnell Coles", "-Dave Collins", "-Dave Concepcion", "-Darren Daulton", "-Doug DeCinces", "-Darrell Evans", "-Dwight Evans", "-Damaso Garcia", "-Dan Gladden", "-Danny Heep", "-Dave Henderson", "-Donnie Hill", "-Dave Kingman", "-Davey Lopes", "-Don Mattingly", "-Darryl Motley", "-Dale Murphy", "-Dwayne Murphy", "-Dave Parker", "-Dan Pasqua", "-Darrell Porter", "-Dick Schofield", "-Don Slaught", "-Darryl Strawberry", "-Dale Sveum", "-Danny Tartabull", "-Dickie Thon", "-Denny Walling", "-Dave Winfield", "-Enos Cabell", "-Eric Davis", "-Eddie Milner", "-Eddie Murray", "-Ernest Riles", "-Ed Romero", "-Ernie Whitt", "-Fred Lynn", "-Floyd Rayford", "-Franklin Stubbs", "-Frank White", "-George Bell", "-Glenn Braggs", "-George Brett", "-Greg Brock", "-Gary Carter", "-Glenn Davis", "-George Foster", "-Gary Gaetti", "-Greg Gagne", "-George Hendrick", "-Glenn Hubbard", "-Garth Iorg", "-Gary Matthews", "-Graig Nettles", "-Gary Pettis", "-Gary Redus", "-Garry Templeton", "-Gorman Thomas", "-Greg Walker", "-Gary Ward", "-Glenn Wilson", "-Harold Baines", "-Hubie Brooks", "-Howard Johnson", "-Hal McRae", "-Harold Reynolds", "-Harry Spilman", "-Herm Winningham", "-Jesse Barfield", "-Juan Beniquez", "-Juan Bonilla", "-John Cangelosi", "-Jose Canseco", "-Joe Carter", "-Jack Clark", "-Jose Cruz", "-Julio Cruz", "-Jody Davis", "-Jim Dwyer", "-Julio Franco", "-Jim Gantner", "-Johnny Grubb", "-Jerry Hairston", "-Jack Howell", "-John Kruk", "-Jeffrey Leonard", "-Jim Morrison", "-John Moses", "-Jerry Mumphrey", "-Joe Orsulak", "-Jorge Orta", "-Jim Presley", "-Jamie Quirk", "-Johnny Ray", "-Jeff Reed", "-Jim Rice", "-Jerry Royster", "-John Russell", "-Juan Samuel", "-John Shelby", "-Joel Skinner", "-Jeff Stone", "-Jim Sundberg", "-Jim Traber", "-Jose Uribe", "-Jerry Willard", "-Joel Youngblood", "-Kevin Bass", "-Kal Daniels", "-Kirk Gibson", "-Ken Griffey", "-Keith Hernandez", "-Kent Hrbek", "-Ken Landreaux", "-Kevin McReynolds", "-Kevin Mitchell", "-Keith Moreland", "-Ken Oberkfell", "-Ken Phelps", "-Kirby Puckett", "-Kurt Stillwell", "-Leon Durham", "-Len Dykstra", "-Larry Herndon", "-Lee Lacy", "-Len Matuszek", "-Lloyd Moseby", "-Lance Parrish", "-Larry Parrish", "-Luis Rivera", "-Larry Sheets", "-Lonnie Smith", "-Lou Whitaker", "-Mike Aldrete", "-Marty Barrett", "-Mike Brown", "-Mike Davis", "-Mike Diaz", "-Mariano Duncan", "-Mike Easler", "-Mike Fitzgerald", "-Mel Hall", "-Mickey Hatcher", "-Mike Heath", "-Mike Kingery", "-Mike LaValliere", "-Mike Marshall", "-Mike Pagliarulo", "-Mark Salas", "-Mike Schmidt", "-Mike Scioscia", "-Mickey Tettleton", "-Milt Thompson", "-Mitch Webster", "-Mookie Wilson", "-Marvell Wynne", "-Mike Young", "-Nick Esasky", "-Ozzie Guillen", "-Oddibe McDowell", "-Omar Moreno", "-Ozzie Smith", "-Ozzie Virgil", "-Phil Bradley", "-Phil Garner", "-Pete Incaviglia", "-Paul Molitor", "-Pete O'Brien", "-Pete Rose", "-Pat Sheridan", "-Pat Tabler", "-Rafael Belliard", "-Rick Burleson", "-Randy Bush", "-Rick Cerone", "-Ron Cey", "-Rob Deer", "-Rick Dempsey", "-Rich Gedman", "-Ron Hassey", "-Rickey Henderson", "-Reggie Jackson", "-Ricky Jones", "-Ron Kittle", "-Ray Knight", "-Randy Kutcher", "-Rudy Law", "-Rick Leach", "-Rick Manning", "-Rance Mulliniks", "-Ron Oester", "-Rey Quinones", "-Rafael Ramirez", "-Ronn Reynolds", "-Ron Roenicke", "-Ryne Sandberg", "-Rafael Santana", "-Rick Schu", "-Ruben Sierra", "-Roy Smalley", "-Robby Thompson", "-Rob Wilfong", "-Reggie Williams", "-Robin Yount", "-Steve Balboni", "-Scott Bradley", "-Sid Bream", "-Steve Buechele", "-Shawon Dunston", "-Scott Fletcher", "-Steve Garvey", "-Steve Jeltz", "-Steve Lombardozzi", "-Spike Owen", "-Steve Sax", "-Tony Armas", "-Tony Bernazard", "-Tom Brookens", "-Tom Brunansky", "-Tony Fernandez", "-Tim Flannery", "-Tom Foley", "-Tony Gwynn", "-Terry Harper", "-Toby Harrah", "-Tommy Herr", "-Tim Hulett", "-Terry Kennedy", "-Tito Landrum", "-Tim Laudner", "-Tom O'Malley", "-Tom Paciorek", "-Tony Pena", "-Terry Pendleton", "-Tony Perez", "-Tony Phillips", "-Terry Puhl", "-Tim Raines", "-Ted Simmons", "-Tim Teufel", "-Tim Wallach", "-Vince Coleman", "-Von Hayes", "-Vance Law", "-Wally Backman", "-Wade Boggs", "-Will Clark", "-Wally Joyner", "-Wayne Krenchicki", "-Willie McGee", "-Willie Randolph", "-Wayne Tolleson", "-Willie Upshaw", "-Willie Wilson" ],
[ 1, 14, 3, 11, 2, 11, 2, 3, 2, 13, 10, 9, 4, 6, 13, 3, 15, 5, 12, 8, 1, 1, 6, 6, 18, 6, 7, 10, 5, 14, 17, 3, 9, 5, 7, 14, 4, 2, 16, 1, 2, 18, 9, 4, 11, 6, 3, 5, 16, 6, 17, 2, 4, 9, 12, 6, 4, 14, 12, 6, 1, 16, 4, 4, 3, 17, 4, 3, 4, 12, 17, 3, 14, 18, 15, 9, 4, 8, 6, 4, 16, 15, 5, 5, 11, 9, 14, 2, 16, 4, 5, 4, 1, 3, 8, 12, 14, 15, 3, 7, 10, 2, 8, 10, 13, 6, 3, 14, 5, 1, 14, 5, 13, 3, 18, 6, 4, 16, 9, 8, 15, 20, 5, 5, 11, 13, 5, 8, 5, 7, 7, 5, 18, 4, 9, 3, 6, 15, 5, 2, 2, 4, 12, 17, 10, 6, 14, 5, 11, 15, 11, 2, 1, 10, 10, 5, 13, 4, 15, 3, 12, 6, 3, 13, 14, 3, 4, 6, 4, 4, 13, 2, 3, 3, 11, 5, 1, 8, 14, 13, 6, 10, 4, 2, 9, 10, 7, 3, 1, 7, 2, 12, 15, 6, 7, 10, 13, 1, 3, 9, 10, 1, 5, 4, 7, 2, 2, 13, 4, 6, 8, 9, 1, 3, 6, 3, 3, 2, 7, 3, 3, 4, 7, 4, 5, 4, 2, 2, 12, 9, 7, 4, 14, 1, 9, 5, 24, 5, 6, 5, 12, 5, 12, 16, 3, 18, 7, 9, 8, 20, 1, 5, 11, 1, 7, 6, 12, 10, 9, 1, 7, 4, 6, 6, 4, 3, 1, 12, 1, 10, 2, 13, 6, 3, 4, 2, 2, 6, 18, 4, 2, 4, 6, 2, 8, 8, 6, 4, 8, 4, 5, 7, 17, 8, 4, 1, 7, 6, 5, 17, 7, 3, 23, 5, 10, 8, 19, 4, 7, 2, 6, 7, 7, 5, 1, 1, 8, 5, 12, 6, 8, 11 ],
[ 66, 81, 130, 141, 87, 169, 37, 73, 81, 92, 159, 53, 113, 60, 43, 39, 158, 46, 104, 32, 92, 109, 10, 116, 168, 163, 73, 129, 152, 137, 84, 108, 141, 168, 49, 106, 36, 60, 98, 61, 41, 54, 57, 46, 40, 68, 132, 57, 140, 146, 101, 53, 7, 168, 101, 102, 58, 61, 78, 177, 113, 44, 56, 53, 3, 139, 37, 53, 142, 113, 81, 31, 131, 122, 137, 119, 97, 55, 103, 96, 118, 70, 238, 46, 163, 83, 174, 82, 41, 114, 83, 123, 78, 138, 69, 119, 148, 71, 115, 110, 151, 132, 49, 106, 114, 37, 95, 154, 198, 51, 128, 76, 125, 152, 64, 171, 118, 77, 94, 85, 96, 77, 139, 84, 126, 59, 78, 120, 158, 169, 104, 54, 70, 99, 39, 40, 170, 103, 69, 103, 144, 200, 55, 133, 45, 132, 39, 183, 136, 70, 61, 41, 86, 95, 147, 102, 94, 100, 93, 163, 47, 174, 39, 200, 66, 76, 157, 92, 73, 69, 91, 54, 101, 43, 47, 184, 58, 118, 150, 171, 147, 74, 161, 91, 159, 136, 85, 223, 64, 127, 127, 70, 141, 52, 149, 84, 128, 34, 92, 146, 157, 54, 179, 53, 131, 56, 93, 148, 59, 131, 88, 65, 54, 71, 77, 120, 60, 1, 94, 43, 75, 167, 110, 76, 93, 76, 137, 152, 84, 144, 80, 163, 83, 135, 123, 160, 52, 56, 154, 72, 77, 96, 56, 70, 108, 68, 119, 110, 160, 101, 6, 82, 145, 44, 80, 76, 52, 90, 135, 68, 119, 27, 68, 178, 86, 57, 101, 113, 149, 63, 84, 163, 117, 66, 140, 112, 145, 159, 142, 96, 103, 122, 210, 2, 169, 76, 152, 213, 103, 70, 211, 68, 63, 141, 120, 4, 43, 47, 46, 61, 147, 138, 51, 113, 42, 194, 32, 69, 112, 139, 186, 81, 124, 207, 117, 172, 53, 127, 136, 126, 144, 170 ],
[ null,               475,               480,               500,              91.5,               750,                70,               100,                75,              1100,           517.143,             512.5,               550,               700,               240, null,               775,               175, null,               135,               100,               115, null,               600,           776.667,               765,           708.333,               750,               625,               900, null,               110, null,             612.5,               300,               850, null,                90, null, null,              67.5, null, null,               180, null,               305,               215,             247.5, null,               815,               875,                70, null,              1200,               675,               415,               340, null,           416.667,              1350,                90,               275,               230,               225, null,               950, null,                75,               105, null,               320, null,               850,               535,           933.333,               850,               210, null,               325,               275, null,               450,              1975, null,              1900,               600,          1041.667,               110,               260,               475,             431.5,              1220,                70,               145, null,               595,           1861.46, null,               300,               490,              2460, null,               375, null, null, null, null,               750,              1175,                70,              1500,               385,          1925.571,               215, null,               900,               155,               700,               535,             362.5,           733.333,               200,               400,               400,             737.5, null,               500,               600,             662.5,               950,               750,             297.5,               325,              87.5,               175,                90,            1237.5,               430, null,               100,               165,               250,              1300,           773.333, null,          1008.333,               275,               775,               850,               365, null,                95,               110,               100,             277.5,                80,               600, null, null,               200, null,               657,                75,            2412.5,               250,               155,               640,               300,               110, null,               825, null,               195, null,               450,               630,              86.5,              1300,              1000,              1800,              1310,             737.5,               625,               125,          1043.333,               725,               300,               365,                75,          1183.333,             202.5,               225,               525,               265,             787.5,               800,             587.5, null,               145, null,               420,                75,               575, null,               780,                90,               150,               700, null,               550, null,               650,                68,               100,               670,               175,               137,          2127.333,               875,               120,               140,               210,               800,               240,               350, null,               175,               200, null,              1940,               700,               750,               450,               172,              1260, null,               750,               190,               580,               130,               450,               300,               250,              1050,               215,               400, null,               560,              1670,             487.5, null,               425,               500, null, null,               250,               400,               450,               750,                70,               875,               190,               191,               740,               250,               140,              97.5,               740,               140,           341.667, null,              1000,               100,                90,               200,               135,               155,               475,              1450,               150,               105,               350,                90, null,               530,           341.667,               940,               350,           326.667,               250,               740,               425, null,               925,               185,               920,           286.667,               245, null,               235,              1150,               160, null,               425,               900, null,               500,             277.5,               750,               160,              1300,               525,               550,              1600,               120,               165, null,               700,               875,               385,               960,              1000 ] 
],
"isDF": true,
"container": "<table>\n  <thead>\n    <tr>\n      <th> </th>\n      <th>Years</th>\n      <th>Hits</th>\n      <th>Salary</th>\n    </tr>\n  </thead>\n</table>",
"options": {
 "iDisplayLength":                 5,
"columnDefs": [
 {
 "orderable": false,
"targets":                 0 
},
{
 "className": "dt-right",
"targets": [                 1,                 2,                 3 ] 
} 
],
"order": [] 
},
"callback": "function(table) {}",
"colnames": [ " ", "Years", "Hits", "Salary" ] 
},"evals": [  ] }</script><!--/html_preserve-->


## Predict salary based on Hits and Years Played

<img src="slides_files/figure-html/unnamed-chunk-2-1.png" title="" alt="" style="display: block; margin: auto;" />


## How to split the data

<img src="slides_files/figure-html/unnamed-chunk-3-1.png" title="" alt="" style="display: block; margin: auto;" />


## How to split the data

<img src="slides_files/figure-html/p2-1.png" title="" alt="" style="display: block; margin: auto;" />


## How to split the data

<img src="slides_files/figure-html/p4-1.png" title="" alt="" style="display: block; margin: auto;" />

## How to split the data

<img src="slides_files/figure-html/p5-1.png" title="" alt="" style="display: block; margin: auto;" />


## Regression Tree for Baseball data
<div class="columns-2">

<img src="slides_files/figure-html/p3-1.png" title="" alt="" style="display: block; margin: auto;" />

    - Years is the most important factor in 
    determining Salary
    - Given that a player is less 
    experienced, the number of Hits that 
    he made in the previous year seems 
    to play little role in his Salary
    - Among players who have been in 
    the major leagues for five or more years, 
    the number of Hits made in the previous 
    year does affect Salary
    
</div>

## Decision Tree

<div class="columns-2">

<img src="slides_files/figure-html/p2-1.png" alt="test" style="width: 500px;"/>

<img src="slides_files/figure-html/p3-1.png" alt="test" style="width: 500px;"/>

</div>

## More Details of Tree Building

> - The goal is to find boxes $R_1,\ldots, R_J$ that minimize the residual sum of squares give by

> - $$ \sum_{j=1}^J \sum_{i \in R_j} (y_i - \hat{y}_{Rj}) $$

> - $y_i$ is the subjects response, $\hat{y}_{Rj}$ is the mean in box $j$

> - Computationally infeasible to consider every single partition of the feature space into J boxes

> - Solution: take a top-down, greedy approach

> - Begins at the top, and never looks back
    
## Pros and Cons

> - Tree-based methods are simple and useful for interpretation
> - Highly sensity to the first split
> - Solution: Combining a large number of trees can often result in
dramatic improvements in prediction accuracy, at the
expense of some loss interpretation.

# Bagging

## The Bootstrap

<img src="bootstrap.png" alt="test" style="width: 550px;"/>
[@islr]

## Pull yourself up by your bootstraps

<div class="centered">
<img src="bootstrap2.jpg" alt="test" style="width: 350px;"/>
</div>

## Random Forests

<img src="intuition.png" alt="test" style="width: 750px;"/>
[ETH Zurich Slides](http://stat.ethz.ch/education/semesters/ss2012/ams/slides/v10.2.pdf)




# Acknowledgements

## Regression tree slides are based on 

<img src="islr.png" alt="test" style="width: 300px;"/>
[Free PDF book](http://stat.ethz.ch/education/semesters/ss2012/ams/slides/v10.2.pdf)

## Leo Breiman (1928-2005)

<div class="centered">
<img src="leo.jpg" alt="test" style="width: 450px;"/>
</div>

# References

---


