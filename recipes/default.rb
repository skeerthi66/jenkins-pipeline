# Cookbook

file '/home/chefadmin/my_cookbook/recipes/write_file.txt' do
  content 'Hello'
  mode '0755'
  owner 'saikeerthi'
  group 'root'
end

ruby_block 'print_file_content' do
  block do
    file_path = '/home/chefadmin/my_cookbook/recipes/write_file.txt'
    if File.exist?(file_path)
      content = File.read(file_path)
      puts "File content: #{content}"
    else
      puts "File does not exist: #{file_path}"
    end
  end
  action :run
end
