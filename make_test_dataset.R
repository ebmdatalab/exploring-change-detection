library(stringr)
library(purrr)

file_list = dir( "dat", full.names = TRUE )

data.pick_new = data.frame()
result.list_new = c()

for ( f in file_list ) {
    these_ids = basename(f) %>% str_remove( "_.*" ) %>% str_split( "-" ) %>% unlist
    
    if ( length( these_ids ) > 0 ) {
        load( f )
        
        these_variables = glue("{variable}.{these_ids}")
        these_data = data.pick %>% select( !!!syms(these_variables) )
        
        if ( ncol(data.pick_new) == 0 ) {
            data.pick_new = these_data
        } else {
            data.pick_new = data.pick_new %>% bind_cols( these_data )
        }
        
        result.list_new = c( result.list_new, result.list[these_variables] )
    }
}

data.pick = data.pick_new
result.list = result.list_new
names.rel = colnames(data.pick_new)


save( data.pick,
      result.list,
      names.rel,
      file="OUTPUT.Rdat")
