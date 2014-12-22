Make sure ssh config matches data in **inventory** file.
Then check the connection.

<pre>
$ ansible machine -i inventory -m ping
machine | success >> {
    "changed": false,
    "ping": "pong"
}
</pre>

Provision:

<pre>
$ ansible-playbook setup-mono.yml -i inventory
$ ansible-playbook setup-ui.yml -i inventory
</pre>

Inside the machine:

<pre>
sudo tar xfz poweralleyui-1.3.0.tar.gz -C /opt/
sudo chown -R bms:bms /opt/poweralleyui-1.3.0
sudo ln -s /opt/poweralleyui-1.3.0 /opt/poweralleyui
</pre>

Correct db's credentials in /opt/poweralleyui/Web.config.

Reboot:

<pre>
# reboot
</pre>
