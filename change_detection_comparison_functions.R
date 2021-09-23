make_empty_results_holder = function( list_of_variables ) {
    results <- data.frame(name=list_of_variables)
    
    ### Number of Detected Breaks
    results$is.nbreak <- NA ### Number of breaks
    
    ### Timing Measures
    results$is.tfirst <- NA ### First negative break
    results$is.tfirst.pknown <- NA  ### First negative break after a known intervention date
    results$is.tfirst.pknown.offs <- NA  ### First negative break after a known intervention date not offset by a XX% increase
    results$is.tfirst.offs <- NA  ###First negative break not offset by a XX% increase
    results$is.tfirst.big <- NA ###steepest break as identified by is.slope.ma
    
    ### Slope Measures
    results$is.slope.ma <- NA ### Average slope over steepest segment contributing at least XX% of total drop
    results$is.slope.ma.prop <- NA ### Average slope as proportion to prior level
    results$is.slope.ma.prop.lev <- NA ### Percentage of the total drop the segment used to evaluate the slope makes up
    
    ### Level Measures
    results$is.intlev.initlev <- NA  ### Pre-drop level
    results$is.intlev.finallev <- NA ### End level
    results$is.intlev.levd <- NA ### Difference between pre and end level
    results$is.intlev.levdprop <- NA ### Proportion of drop
    
    return( results )
    
}


### This is the list of variables to save
target_list = c("this_name",
                "islstr.res",
                "tis.path",
                "trendline",
                "nbreak",
                "fit.res",
                "is.first.pknown",
                "coef.p.hl",
                "mconst.res",
                "big.break.index",
                "data.pick",
                "tdates",
                "is.first")

generate_y_locations = function( d ) {
    return( c(mean(range(d, na.rm=TRUE)), mean(range(d, na.rm=TRUE))+IQR(d, na.rm=TRUE) ) )
}
