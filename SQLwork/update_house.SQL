update базадомов
  set dom  = space(5-length(trim(dom)))+trim(dom),
      korp = space(5-length(trim(korp)))+trim(korp),
      kv   = space(5-length(trim(kv)))+trim(kv);
