# OpenAlley setup

First download and unzip.

<pre>
$ cd /opt
$ sudo wget https://github.com/PowerMeMobile/alley-setup/archive/master.zip
$ sudo master.zip
$ cd /opt/alley-setup-master
</pre>

Adjust setup/build configuration options in conf/setup.conf before going further.

It's possible to setup everything by running one command.
The setup will create a new user, setup environment, setup OpenAlley, and setup autostart on reboot.

<pre>
$ sudo setup/setup-all &lt;centos6 | fedora20 | rhel6 | debian7 | ubuntu10.04| ubuntu12.04 | arch&gt;
</pre>

Or make partial setup by running:
<pre>
$ sudo setup/setup-env &lt;centos6 | fedora20 | rhel6 | debian7 | ubuntu10.04| ubuntu12.04 | arch&gt;
$ source /etc/profile
</pre>

<pre>
$ sudo setup/setup-alley
</pre>

<pre>
$ sudo setup/setup-autostart
</pre>

Now login using just create new user.

<pre>
$ su - alley
</pre>

<pre>
$ cd /opt/alley-setup-master
</pre>

<pre>
$ run/start-all
</pre>

<pre>
$ conf/http-conf.sh
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
