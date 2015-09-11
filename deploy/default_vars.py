#********************************
# WARNING WARNING WARNING
#********************************

# YOU MUST NOT MODIFY THIS FILE!

# If you need to override the values of the variables defined in this file you should
# Copy and paste this file with the name local_vars.py and set your values there.

# When you create a file local_vars.py and define the values there, the fabfile.py file will use
# your values and not the values defined in this file.


#********************************
# END WARNING
#********************************

from os import path

# The Apache user
APACHE = 'www-data'

# Variables to use at your local machine
LOCAL_WORKSPACE = path.join(path.dirname(__file__), path.pardir)
LOCAL_DRUPAL_ROOT = '{}/src/drupal'.format(LOCAL_WORKSPACE)

# Variables to use inside the docker container
DOCKER_WORKSPACE = "/opt/indus-demo"
DOCKER_DRUPAL_ROOT = "/opt/indus-demo/src/drupal"
DOCKER_PORT_TO_BIND = 8001

# Database variables
DB_USER = 'dev'
DB_PASS = 'dev'
DB_HOST = 'localhost'
DB_NAME = 'db_indusdemo'

# Site variables
SITE_NAME = 'DrupalCamp MTL 12'
SITE_SUBDIR = 'default'
SITE_PROFILE = 'indus_profile'
SITE_ADMIN_NAME = 'admin'
SITE_ADMIN_PASS = 'admin'
SITE_ENVIRONMENT = 'local'
SITE_HOSTNAME = 'local.indus-demo.dk'

# Projects variables
PROJECT_NAME = 'sfl_boilerplate'
PROFILE = {'indus_profile':'git@github.com:sfl-drupal/indus-profile.git'}
PROFILE_MAKE_FILE = 'build/demo.make'

# Drush commands to be run at the end of the installation process
POST_INSTALL = ['drush fra -y', 'drush cc all']
# Drush commands to be run at the end of the update process
POST_UPDATE = ['drush fra -y', 'drush cc all']
