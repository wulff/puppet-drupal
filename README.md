This Puppet manifest configures Nginx, MySQL, and PHP-FPM for use as a Drupal hosting platform.

To get started, run the following commands to update the package lists and install the packages required to download and use the manifest:

    sudo apt-get update
    sudo apt-get install git-core openssh-server puppet

Next, clone the Git repository:

    git clone git@github.com:wulff/puppet-drupal.git

When you have cloned the directory, use Puppet to setup all the required packages (you can add `--noop` to perform a dry run):

    sudo puppet --verbose --modulepath=/path/to/puppet-drupal/modules /path/to/puppet-drupal/manifests/site.pp
