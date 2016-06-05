## Create a file with some user-data in it
cat > seed-data <<EOF
#cloud-config
password: passw0rd
chpasswd: { expire: False }
ssh_pwauth: True
EOF

## create the disk with NoCloud data on it.
cloud-localds seed.img seed-data
