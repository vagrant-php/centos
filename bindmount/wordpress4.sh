echo "Executing bindmount for $1 ..."
mkdir -p /tmp/$1/cache/
chown -Rf vagrant:vagrant /tmp/$1/cache/
mkdir -p /vagrant/wp-content/cache/
mount -o bind /tmp/$1/cache/ /vagrant/wp-content/cache/
echo "... done!"