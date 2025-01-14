# VMware ESX3 template Kickstart file

# Installation Method
url --url=http://[UDA_IPADDR]/[OS]/[FLAVOR]

# root Password
rootpw secret

# Authconfig
auth --enableshadow --enablemd5

# BootLoader ( The user has to use grub by default )
bootloader --driveorder=[DISKTYPE] --location=mbr

# Timezone
timezone Europe/London

# X windowing System
skipx

# Install or Upgrade
install

# Text Mode
text

# Network install type
#network --bootproto static --ip 192.168.3.103 --netmask 255.255.255.0 --gateway 192.168.3.254 --nameserver 192.168.3.130 --hostname esx3.vi3book.com --addvmportgroup=0 --vlanid=0
network --bootproto dhcp

# Language
lang en_US

# Langauge Support
langsupport --default en_US

# Keyboard
keyboard us

# Mouse
mouse none

# Reboot after install ?
reboot

# Firewall settings
firewall --disabled

# Clear Partitions
clearpart --all --initlabel --drives=[DISKTYPE]

# Partitioning
part /boot --fstype ext3 --size 250 --ondisk [DISKTYPE]
part swap --size 1600 --ondisk [DISKTYPE]
part / --fstype ext3 --size 5120 --ondisk [DISKTYPE]
part /var --fstype ext3 --size 2048 --ondisk [DISKTYPE]
part /tmp --fstype ext3 --size 2048 --ondisk [DISKTYPE]
part /opt --fstype ext3 --size 2048 --ondisk [DISKTYPE]
part /home --fstype ext3 --size 2048 --ondisk [DISKTYPE]
part None --fstype vmkcore --size 100 --ondisk [DISKTYPE]
part /vmimages --fstype ext3 --size 1 --grow --ondisk [DISKTYPE]

# VMware Specific Commands
vmaccepteula
vmlicense --mode=server --server=27000@virtualcenter.vi3book.com --edition=esxFull

%packages
@base

%vmlicense_text

%post
cat > /tmp/esxcfg.sh <<EOF1
#!/bin/sh
# Configure ESX Server

# Create vSwitch1 with a port group of Internal
esxcfg-vswitch -a vSwitch1
esxcfg-vswitch -A Internal vSwitch1
# Create a vSwitch2 with a port group of Production using vmnic1
esxcfg-vswitch -a vSwitch2
esxcfg-vswitch -A Production vSwitch2
esxcfg-vswitch -L vmnic1 vSwitch2

# Create a vSwitch3 with a port group of Production using vmnic2
esxcfg-vswitch -a vSwitch3
esxcfg-vswitch -A VMotion vSwitch3
esxcfg-vswitch -L vmnic2 vSwitch3
esxcfg-vmknic -a VMotion -i 10.0.0.3 -n 255.255.255.0
# DOES NOT ENABLE VMOTION. LOAD VI-CLIENT AND ENABLE

# Create a vSwitch4 with a port group iSCSI/iSCSI-CIS using vmnic3
esxcfg-vswitch -a vSwitch4
esxcfg-vswitch -A iSCSI vSwitch4
esxcfg-vmknic -a iSCSI -i 172.168.3.113 -n 255.255.255.0
esxcfg-vswitch -A iSCSI-COS vSwitch3
esxcfg-vswif - vswif1 -p iSCSI-COS -i 172.168.3.103 -n 255.255.255.0
esxcfg-vswitch -L vmnic3 vSwitch4

# Set-up iSCSI Software Emulator
# esxcfg-swiscsi -e
# vmkiscsi-tool -D -a 172.168.3.210 vmhba40
# esxcfg-swiscsi -s
# esxcfg-rescan vmhba40

# Create a local user for SSH Access - Default password is password
useradd -p '$1$Rg69B9QA$JUtqStBrjNFbyzyP9zTsf0' -c "New Account Created By Kickstart" newaccount

# Allow ROOT access using SSH - Warning this is NOT the must secure configuration!!!
sed -e 's/PermitRootLogin no/PermitRootLogin yes/' /etc/ssh/sshd_config > /etc/ssh/sshd_config.new
mv -f /etc/ssh/sshd_config.new /etc/ssh/sshd_config
service sshd restart

# Enable the SSH client (Out/From an ESX hosts)
esxcfg-firewall -e sshClient
EOF1

# Make esxcfg.sh eXcutable
chmod +x /tmp/esxcfg.sh

# Backup original rc.local file
cp /etc/rc.d/rc.local /etc/rc.d/rc.local.bak

# Make esxcfg.sh run from rc.local and make rc.local reset itself
cat >> /etc/rc.d/rc.local <<EOF
cd /tmp
/tmp/esxcfg.sh
mv -f /etc/rc.d/rc.local.bak /etc/rc.d/rc.local
EOF

