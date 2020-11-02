#
# Cookbook:: tfc_agent
# Resource:: tfc_agent
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

provides :tfc_agent

property :image, String, default: 'hashicorp/tfc-agent'
property :tag,   String, default: 'latest'
property :token, String, required: true, sensitive: true

action_class do
  def call_action(action)
    send("action_#{action}")
  end
end

default_action :run

action :create do
  docker_image "#{new_resource.image}:#{new_resource.tag}" do
    repo new_resource.image
    tag new_resource.tag
  end
end

action :start do
  docker_container 'tfc-agent' do
    repo new_resource.image
    tag new_resource.tag
    env ["TFC_AGENT_NAME=#{new_resource.name}", "TFC_AGENT_TOKEN=#{new_resource.token}"]
    action :run
  end
end

action :run do
  call_action(:create)
  call_action(:start)
end

action :stop do
  docker_container 'tfc-agent' do
    repo new_resource.image
    tag new_resource.tag
    env ["TFC_AGENT_NAME=#{new_resource.name}", "TFC_AGENT_TOKEN=#{new_resource.token}"]
    action :stop
  end
end

action :remove do
  call_action(:stop)

  docker_image "#{new_resource.image}:#{new_resource.tag}" do
    repo new_resource.image
    tag new_resource.tag
    action :remove
  end
end
