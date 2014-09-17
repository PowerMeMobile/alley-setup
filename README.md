# Open Alley setup

First download and unzip.

<pre>
# cd /opt
# wget -O master.zip https://github.com/PowerMeMobile/alley-setup/archive/master.zip
# unzip master.zip
# cd alley-setup-master
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
# setup/setup-alley &lt;centos6 | fedora20 | rhel6 | debian7 | ubuntu10.04| ubuntu12.04 | arch&gt;
# setup/setup-autostart
</pre>

Now login using the created user.

<pre>
# su - bms
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
$ smppload -iuser -ppassword -s375296660002 -d375291112233 -c10 -D -v
INFO:  Connected to 127.0.0.1:2775
INFO:  Bound to Funnel
INFO:  Stats:
INFO:     Send success:     10
INFO:     Delivery success: 10
INFO:     Send fail:        0
INFO:     Delivery fail:    0
INFO:     Errors:           0
INFO:     Avg Rps:          2 mps
INFO:  Unbound
</pre>

<pre>
$ run/get-alley-statuses
{"unrecognized":0,"rejected":0,"accepted":0,"deleted":0,"expired":0,"delivered":10,"failed":0,"sent":0,"received":0,"undeliverable":0,"enroute":0,"pending":0,"unknown":0}
</pre>
