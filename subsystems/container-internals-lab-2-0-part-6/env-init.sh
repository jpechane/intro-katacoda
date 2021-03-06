# General Preparation
ssh root@host01 'git clone --depth 1 https://github.com/fatherlinux/container-internals-lab.git ~/labs'
ssh root@host01 'yum remove -y podman'
ssh root@host01 'yum install -y http://assets.joinscrapbook.com/redhat/packages/podman-1.3.2-1.git14fdcd0.el7.centos.x86_64.rpm'
ssh root@host01 'yum install -y buildah skopeo skopeo-containers tree httpd-tools strace &'

# Lab 1
ssh root@host01 'cp -f ~/labs/lab1-step3/mega-proc.sh /usr/bin/mega-proc.sh'

# Lab 2

# Lab 3

# Lab 4
ssh root@host01 'cp -f ~/labs/lab3-step1/atomic-openshift-master.service /etc/systemd/system/atomic-openshift-master.service'
ssh root@host01 'cp -f ~/labs/lab3-step1/atomic-openshift-node.service /etc/systemd/system/atomic-openshift-node.service'
ssh root@host01 'systemctl disable --now origin.service'
ssh root@host01 'systemctl enable --now atomic-openshift-master.service; systemctl enable --now atomic-openshift-node.service'

# Lab 5
ssh root@host01 'git clone --depth 1 --single-branch --branch lab4-step1 https://github.com/fatherlinux/wordpress-demo.git ~/labs/lab4-step1'
ssh root@host01 '~/labs/lab4-step1/create.sh'
ssh root@host01 'sed -i s/wpfrontend-wordpress.apps.example.com/`hostname`/ ~/labs/lab4-step1/wordpress-objects.yaml'

# Lab 8
ssh root@host01 'git clone --depth 1 --single-branch --branch centos7 https://github.com/fatherlinux/container-supply-chain.git ~/labs/lab2-step4/'

# Final Preparation
ssh root@host01 'docker pull rhel7'
ssh root@host01 'docker pull rhel7-atomic'
ssh root@host01 'docker pull nate/dockviz'
ssh root@host01 'docker pull centos'
ssh root@host01 'docker pull fedora'
ssh root@host01 'docker pull ubuntu'
ssh root@host01 'docker pull openshift3/mysql-55-rhel7'
ssh root@host01 'podman pull rhel7'
ssh root@host01 'podman pull centos'
ssh root@host01 'podman pull fedora'
ssh root@host01 '/var/lib/openshift/openshift admin policy add-cluster-role-to-user cluster-admin admin'
