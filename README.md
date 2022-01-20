This repo documents some exploration that I carried out into the interpretation of the
[change detection/indicator saturation](https://github.com/ebmdatalab/change_detection)
algorithm output.

At this point, I think I have a reasonable grip of what the algorithm is doing 
and how the results should be interpreted.

The main steps of result interpretation are:

1. Breaks are identified and selected on the basis of whether they are
up/down/either and whether they occur after some prespecified event. This is the
last place where the direction of the change specified is used.

2. Working from the first break after the pre-specified event, the biggest slope
is identified across the shortest interval (this is the grid search). This
biggest slope is ALWAYS going to match the general trend from this point
onwards.

Things to remember:

- the ONLY place that the requested direction is used is to find the starting
point of the search for the biggest slope
- the steepest slope has to have the same general direction as the time series
after the first, non-offset break 
- the offset segments are only relevant when finding the first break - an offset
segment can end up being the steepest slope

Note that `make_test_dataset.R` compiles several dummy datasets together (these
were generated as part of the PINCER project) and saves them in `OUTPUT.Rdat`).
If `OUTPUT.Rdat` does not exist, then this should be run before
`change_detection_comparison.Rmd`.


