# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo adding swap file
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap defaults 0 0' >> /etc/fstab

echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential libreadline-dev
install Ruby ruby2.3 ruby2.3-dev

echo installing Bundler
gem install bundler -N >/dev/null 2>&1


install Git git
install SQLite sqlite3 libsqlite3-dev

install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev zlib1g-dev liblzma-dev
install 'Blade dependencies' libncurses5-dev
install 'ExecJS runtime' nodejs



update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
