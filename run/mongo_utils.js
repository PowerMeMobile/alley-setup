var mailbox_count = function() {
    tables = [
        "db.mb_funnel_receipts",
        "db.mb_incoming_sms",
        "db.mb_k1api_input_id_to_sub_id",
        "db.mb_k1api_receipt_subs",
        "db.mb_k1api_receipts",
        "db.mb_pending_items",
        "db.mb_subscriptions"
    ];
    tables.forEach(function(table) {
        var count = eval(table + ".count();");
        print(table + " " + count);
    });
};

var mailbox_remove = function() {
    tables = [
        "db.mb_funnel_receipts",
        "db.mb_incoming_sms",
        "db.mb_k1api_input_id_to_sub_id",
        "db.mb_k1api_receipt_subs",
        "db.mb_k1api_receipts",
        "db.mb_pending_items",
        "db.mb_subscriptions"
    ];
    tables.forEach(function(table) {
        eval(table + ".remove({});");
    });
};

var config_count = function() {
    tables = [
        "db.customers",
        "db.gateways",
        "db.network_maps",
        "db.networks",
        "db.providers",
        "db.mb_msisdns"
    ];
    tables.forEach(function(table) {
        var count = eval(table + ".count();");
        print(table + " " + count);
    });
};

var config_remove = function() {
    tables = [
        "db.customers",
        "db.gateways",
        "db.network_maps",
        "db.networks",
        "db.providers",
        "db.mb_msisdns"
    ];
    tables.forEach(function(table) {
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
