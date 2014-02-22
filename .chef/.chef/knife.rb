log_level                :info
log_location             STDOUT
node_name                'dave'
client_key               '/Users/dave/.chef/dave.pem'
validation_client_name   'workstation'
validation_key           '/Users/dave/.chef/workstation.pem'
chef_server_url          'https://chef-test-01.local:443'
syntax_check_cache_path  '/Users/dave/.chef/syntax_check_cache'
cookbook_path [ '~/chef-repo//cookbooks' ]
