name 'webserver'
default_source :supermarket
run_list 'my_cookbook::default'
cookbook 'my_cookbook', path: '../my_cookbook'

