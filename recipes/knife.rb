current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                'sk'
client_key               "#{current_dir}/your_node_name.pem"
chef_server_url          'https://your_chef_server/organizations/correct_org_name'
cookbook_path            ["#{current_dir}/../cookbooks"]
