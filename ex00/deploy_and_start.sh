#!/bin/bash
echo -e '#!/bin/bash\nwhile :\ndo\n\techo "hello world!!!"\n\tsleep 10\ndone' > /bin/hw_script.sh
chmod +x /bin/hw_script.sh
echo -e '[Unit]\n\tDescription= start hello world script\n[Service]\n\tExecStart=/usr/bin/hw_script.sh\n\tType=simple\n\tStandardOutput=tty' > /lib/systemd/system/hw.service
systemctl start hw
