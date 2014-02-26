# OpenAlley setup

$ cd /opt/alley-setup

The setup creates a new user and sets up autostart on reboot.
Adjust setup/build configuration options in conf/setup.conf before going further.

$ sudo setup/setup-all &lt;centos6 | fedora20 | rhel6 | debian7 | ubuntu10.04| ubuntu12.04 | arch&gt;
$ su - alley
$ cd /opt/alley-setup
$ run/start-all
$ conf/test-config
$ run/check-alley
Connected to 127.0.0.1:2775
<pre>
Bound to Funnel
Stats:
   Send success:     10
   Delivery success: 10
   Send fail:        0
   Delivery fail:    0
   Errors:           0
   Avg Rps:          2 mps
Unbound
</pre>
$ run/get-alley-statuses
<pre>{"delivered":10}</pre>
