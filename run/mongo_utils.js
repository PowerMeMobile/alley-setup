var mailbox_tables = [
    "db.mb_funnel_receipts",
    "db.mb_incoming_sms",
    "db.mb_pending_items",
    "db.mb_subscriptions",
    "db.mb_oneapi_input_id_to_sub_id",
    "db.mb_oneapi_receipt_subs",
    "db.mb_oneapi_receipts"
];

var config_tables = [
    "db.customers",
    "db.gateways",
    "db.network_maps",
    "db.networks",
    "db.providers",
    "db.mb_msisdns"
];

var mailbox_count = function() {
    mailbox_tables.forEach(function(table) {
        var count = eval(table + ".count();");
        print(table + " " + count);
    });
};

var mailbox_remove = function() {
    mailbox_tables.forEach(function(table) {
        eval(table + ".remove({});");
    });
};

var config_count = function() {
    config_tables.forEach(function(table) {
        var count = eval(table + ".count();");
        print(table + " " + count);
    });
};

var config_remove = function() {
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
