select * from system.indexes
  where parent='актысмертей' and index_fts_min_length is not null 
        and position('PR_NEP_NAME' in index_expression)>0