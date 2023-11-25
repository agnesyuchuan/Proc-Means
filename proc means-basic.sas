proc means data=sashelp.baseball;
var nHits nRuns;
run;

*maxdex: maxmimum decimal places; 
*output: used to save results;
*Note: place all the statistical items you needed in the "proc" statment; 
proc means data=sashelp.baseball median q1 maxdec=2 nmiss n mean;
var nHits nRuns;
output out=baseball_stats;
run;

*calculate means by group;
proc means data=sashelp.baseball;
class League;
var nHits nRuns;
run;

*By statement is the same as CLASS except the DATA must be SORTED first;
proc sort data=sashelp.baseball out=baseball_sort;
by League;
run;

proc means data=baseball_sort maxdec=2;
by League;
var nHits nRuns;
run;

*WHERE :filter;
*Add title;
proc means data=sashelp.baseball;
var nOuts;
where team not= 'Seattle';
Title 'Summary of Outs for All Teams Except Seattle';
run;




