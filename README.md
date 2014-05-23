# OpenAlley setup

First download and unzip.

<pre>
# cd /opt
# wget -O master.zip https://github.com/PowerMeMobile/alley-setup/archive/master.zip
# unzip master.zip
# cd /opt/alley-setup-master
</pre>

Adjust setup/build configuration options in conf/setup.conf before going further.

It's possible to setup everything by running one command.
The setup will create a new user, setup environment, setup OpenAlley, and setup autostart on reboot.

<pre>
# setup/setup-all &lt;centos6 | fedora20 | rhel6 | debian7 | ubuntu10.04| ubuntu12.04 | arch&gt;
</pre>

Or make partial setup by running:
<pre>
# setup/setup-env &lt;centos6 | fedora20 | rhel6 | debian7 | ubuntu10.04| ubuntu12.04 | arch&gt;
# source /etc/profile
</pre>

<pre>
# setup/setup-alley
</pre>

<pre>
# setup/setup-autostart
</pre>

Now login using just create new user.

<pre>
# su - alley
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
