#
# Cookbook:: tfc_agent
# Recipe:: default
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

docker_installation_package 'default'

docker_service 'default' do
  action [:create, :start]
end

tfc_agent node['tfc_agent']['name'] do
  image node['tfc_agent']['image'] if node['tfc_agent']['image']
  tag node['tfc_agent']['tag'] if node['tfc_agent']['tag']
  token node['tfc_agent']['token']
end
