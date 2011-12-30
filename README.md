This Puppet manifest configures Nginx, MySQL, and PHP-FPM for use as a Drupal hosting platform.

To get started, run the following commands to update the package lists and install the packages required to download and use the manifest:

    sudo apt-get update
    sudo apt-get install git-core puppet

Next, clone the Git repository:

    git clone git@github.com:wulff/puppet-drupal.git

Before you can run Puppet, you must create a file named `settings.pp` in the `manifests` folder (the folder containing the `sites.pp` file. The file must contain the following settings, which are used in various manifests and templates:

    $authorized_key = 'YOUR SSH PUBLIC KEY'
    $mysql_password = 'YOUR DESIRED MYSQL ROOT PASSWORD'
    $username = 'YOUR DESIRED USERNAME'
    $mail = 'YOUR E-MAIL ADDRESS'
    $github_user = 'YOUR GITHUB USERNAME'
    $github_token = 'YOUR GITHUB TOKEN'

Finally, use Puppet to setup all the required packages (you can add `--noop` to perform a dry run):

    sudo puppet --verbose --modulepath=/path/to/puppet-drupal/modules /path/to/puppet-drupal/manifests/site.pp

The sudo manifest assumes that you have created a group named wheel.
