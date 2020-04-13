sudo mkdir /home/otus3/jail /home/otus3/jail/bin/ /home/otus3/jail/lib64/ /home/otus3/jail/lib/
sudo cp /usr/lib64/libtinfo.so.5 /home/otus3/jail/lib64/
sudo cp /usr/lib64/libdl.so.2 /home/otus3/jail/lib64/
sudo cp /usr/lib64/libc.so.6 /home/otus3/jail/lib64/
sudo cp /usr/lib64/ld-linux-x86-64.so.2 /home/otus3/jail/lib64/
sudo cp /bin/bash /home/otus3/jail/bin/
sudo chown -R root:root /home/otus3/jail/
