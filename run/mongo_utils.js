var mailbox_tables = [
    "db.funnel_receipts",
    "db.incoming_sms",
    "db.pending_items",
    "db.subscriptions",
    "db.oneapi_receipt_subs",
    "db.oneapi_receipts"
];

var config_tables = [
    "db.customers",
    "db.gateways",
    "db.network_maps",
    "db.networks",
    "db.providers",
    "db.msisdns"
];

var mailbox_count = function() {
    conn = new Mongo();
    db = conn.getDB("mailbox");

    mailbox_tables.forEach(function(table) {
        var count = eval(table + ".count();");
        print(table + " " + count);
    });
};

var mailbox_remove = function() {
    conn = new Mongo();
    db = conn.getDB("mailbox");

    mailbox_tables.forEach(function(table) {
        eval(table + ".remove({});");
    });
};

var config_count = function() {
    conn = new Mongo();
    db = conn.getDB("kelly");

    config_tables.forEach(function(table) {
        var count = eval(table + ".count();");
        print(table + " " + count);
    });
};

var config_remove = function() {
    conn = new Mongo();
    db = conn.getDB("kelly");

    config_tables.forEach(function(table) {
        eval(table + ".remove({});");
    });
};

var funs = [];
funs["mailbox.count"]  = mailbox_count;
funs["mailbox.remove"] = mailbox_remove;
funs["config.count"]   = config_count;
funs["config.remove"]  = config_remove;

// command comes from outside.
var fun = funs[command];
fun();
