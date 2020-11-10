name             'tfc_agent'
maintainer       'Schuberg Philis'
maintainer_email 'cookbooks@schubergphilis.com'
license          'Apache-2.0'
description      'Installs and configures a Terraform Cloud agent'
version          '0.1.0'
chef_version     '>= 15.0'

issues_url 'https://github.com/SBP-Cookbooks/tfc_agent/issues'
source_url 'https://github.com/SBP-Cookbooks/tfc_agent'

supports 'centos'
supports 'debian'
supports 'ubuntu'

depends 'docker', '~> 7.2'
