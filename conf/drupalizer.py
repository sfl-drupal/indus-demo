from os import path

from fabric.api import env


# Project settings

env.project_name = 'sfl_indus'
env.workspace = path.join(path.dirname(__file__), path.pardir)
env.locale = False


# Site

env.site_root = '{}/src/drupal'.format(env.workspace)
env.site_name = 'SFL Indus'
env.site_environment = 'local'
env.site_profile = 'indus_profile'
env.site_profile_repo = 'git@github.com:sfl-drupal/indus-profile.git'
env.site_profile_makefile = 'build/demo.make'
env.site_db_user = 'dev'
env.site_db_pass = 'dev'
env.site_db_host = 'localhost'
env.site_db_name = 'sfl_indus'
env.site_hostname = 'local.indus.sfl'
env.site_admin_user = 'admin'
env.site_admin_pass = 'admin'
env.site_subdir = 'default'

# Database dump
# To enable it, replace the boolean value with the absolute path of a gzipped SQL dump file.
env.db_dump = False


# Docker

env.docker_workspace = '/opt/sfl'
env.docker_site_root = '{}/src/drupal'.format(env.docker_workspace)
env.bind_port = 8066
env.apache_user = 'www-data'

# Docker auto-added container IP
env.container_ip = '172.17.0.0'


# Hook commands

env.hook_post_install = ['drush fra -y', 'drush cc all']
env.hook_post_update= ['drush fra -y', 'drush cc all']


env.aliases = {
    'dev': {
        'aegir': True,
        'host': 'local.aegir.sfl',
        'user': 'aegir',
        'root': '/var/aegir/platforms/',
        'aegir_platform': '{name}-{env}-{build}',
        'aegir_path': '/var/aegir',
        'aegir_destsrv': 'server_master',
    },
    'dev2': {
        'host': 'local.indus.sfl',
        'user': 'aegir',
        'root': '/var/aegir/drupalizer/drupal/',
    },
}
