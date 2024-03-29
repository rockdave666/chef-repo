#
# Cookbook Name:: openerp
# Recipe:: database
#
# Copyright 2011, Atriso BVBA
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

e = execute "apt-get update" do
  action :nothing
end
e.run_action(:run)

# Install the PostgreSQL client & server
include_recipe "postgresql::client"
include_recipe "postgresql::server"
include_recipe "database::postgresql"

# Create the OpenERP database role
postgresql_connection_info = {
  :host     => '127.0.0.1',
  :port     => node['postgresql']['config']['port'],
  :username => 'postgres',
  :password => node['postgresql']['password']['postgres']
}

postgresql_database 'openerp' do
	connection postgresql_connection_info
  action :create
end

postgresql_database_user node[:openerp][:user] do
  connection postgresql_connection_info
  password   node[:openerp][:password]
  action     :create
end

postgresql_database_user node[:openerp][:user] do
  connection    postgresql_connection_info
  database_name 'openerp'
  privileges    [:all]
  action        :grant
end
