# frozen_string_literal: true

execute 'reset authentication' do
  command 'sudo mysql -e "UPDATE mysql.user SET plugin = \'mysql_native_password\', host=\'%\' WHERE user = \'root\';"'
  action :run
end

execute 'grant priviliges' do
  command 'sudo mysql -e "GRANT ALL ON *.* TO \'root\'@\'%\';"'
  action :run
end

execute 'flush priviliges' do
  command 'sudo mysql -e "FLUSH PRIVILEGES;"'
  action :run
end
