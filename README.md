# puppet-apache-module

To install Puppet Server on Ubuntu:
- Check the hostname of the VM:
○ hostname -f
○ cat /etc/hostname
- Change the hostname of the VM:
○ sudo vi /etc/hostname
- Restart the VM:
○ reboot
- Edit the hosts file and add the VM private IP and FQDN file:
○ sudo vi /etc/hosts
- wget https://apt.puppet.com/puppet-release-jammy.deb 
- sudo dpkg -i puppet-release-jammy.deb
- sudo apt-get update
- sudo apt-get install puppetserver -y
- sudo systemctl enable puppetserver
- Update the puppet.conf file with the certname and the server FQDN like:
○ sudo bash -c 'cat >> /etc/puppetlabs/puppet/puppet.conf <<EOF

[main]
certname = puppetserver.ceq.com
server = puppetserver.ceq.com

EOF'
- sudo systemctl start puppetserver
- sudo systemctl status puppetserver
- sudo vi /etc/default/puppetserver 
- sudo ufw allow 8140


For Certificate Signing in Puppet Server:
- sudo /opt/puppetlabs/bin/puppetserver ca list
- sudo /opt/puppetlabs/bin/puppetserver ca list --all
- sudo /opt/puppetlabs/bin/puppetserver ca sign --certname puppet-agent.example.com

If the Error is related to the Certificates:

FOR PUPPETSERVER:
- sudo /opt/puppetlabs/bin/puppetserver ca list --all
- sudo /opt/puppetlabs/bin/puppetserver ca clean --certname puppet-db.ceq.com 
- sudo /opt/puppetlabs/bin/puppetserver ca clean --certname client01.ceq.com 
- sudo /opt/puppetlabs/bin/puppetserver ca clean --certname client02.ceq.com 
- sudo /opt/puppetlabs/bin/puppetserver ca clean --certname client03.ceq.com 

FOR PUPPET AGENT AND DB:
- sudo rm -rf /etc/puppetlabs/puppet/ssl
- sudo systemctl restart puppet
sudo puppet agent -tv --noop
