# OpenAlley setup

<pre>
$ cd /opt/alley-setup
</pre>

The setup creates a new user and sets up autostart on reboot.
Adjust setup/build configuration options in conf/setup.conf before going further.

<pre>
$ sudo setup/setup-all &lt;centos6 | fedora20 | rhel6 | debian7 | ubuntu10.04| ubuntu12.04 | arch&gt;
</pre>

<pre>
$ su - alley
</pre>

<pre>
$ cd /opt/alley-setup
</pre>

<pre>
$ run/start-all
</pre>

<pre>
$ conf/test-config
</pre>

<pre>
$ run/check-alley
Connected to 127.0.0.1:2775
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

<pre>
$ run/get-alley-statuses
{"delivered":10}
</pre>
