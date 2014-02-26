# encoding: utf-8
# vim: ft=ruby expandtab shiftwidth=2 tabstop=2

packages = %w{php-pecl-xdebug}

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end

# create wpcli dir
template '/etc/php.d/xdebug.ini' do
    source 'xdebug.ini.erb'
    mode 0644
    owner "root"
    group "root"
end

execute 'httpd restart' do
    command "/etc/init.d/httpd restart"
end
