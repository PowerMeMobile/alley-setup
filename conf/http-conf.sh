#!/bin/bash

PORT="8080"
HOST="127.0.0.1"

###
# Be aware:
# Customer's `default_validity' in time format, described in SMPP specification v3.4
###

post() {
    TARGET=$1
    BODY=$2
    echo -n "Creating $TARGET..."
    CODE=`curl -s -D - -X "POST" http://$HOST:$PORT/$TARGET -d $BODY -l -o /dev/null | grep -i http | awk '{ print $2 }'`
    if [ "$CODE" != "201" ]; then
        echo -e "\nUnexpected return code [$TARGET:$BODY:$CODE]"
        exit 1
    fi
    echo "OK"
}

#
# Gateways
#

post gateways "id=7dc235d0-c938-4b66-8f8c-c9037c7eace7&name=SMPPSim&rps=10000"

# set gateway's settings
#post "gateways/7dc235d0-c938-4b66-8f8c-c9037c7eace7/settings" "id=log_smpp_pdus&value=true"

#
# Connections (SMPPSim)
#
post "gateways/7dc235d0-c938-4b66-8f8c-c9037c7eace7/connections" "id=1&host=127.0.0.1&port=8001&bind_type=transmitter&system_id=smppclient1&password=password&system_type=SMPP&addr_ton=1&addr_npi=1&addr_range="

post "gateways/7dc235d0-c938-4b66-8f8c-c9037c7eace7/connections" "id=2&host=127.0.0.1&port=8001&bind_type=receiver&system_id=smppclient2&password=password&system_type=SMPP&addr_ton=1&addr_npi=1&addr_range="

#
# Providers
#
post "providers" 'id=0a89542c-5270-11e1-bf27-001d0947ec73&name=SMPPSim%20Provider&description=&gateway_id=7dc235d0-c938-4b66-8f8c-c9037c7eace7&bulk_gateway_id=7dc235d0-c938-4b66-8f8c-c9037c7eace7&receipts_supported=true&sms_add_points=0.0'

#
# Networks
#
post "networks" 'id=0456837f-e874-4b05-8e89-95ae20b897d2&name=Mobile%20Telesystems&country=Belarus&hex_code=&country_code=375&number_len=9&prefixes=292;295;296;297;298;33&gmt_diff=%2B2&dst=7,5,3;7,5,10&provider_id=0a89542c-5270-11e1-bf27-001d0947ec73&is_home=true&sms_points=2.0&sms_mult_points=1.0'

post "networks" 'id=6dd0af45-7cdf-41aa-954b-cc368fe1968e&name=Velcom%20Mobile%20Digital%20Comm.&country=Belarus&hex_code=&country_code=375&number_len=9&prefixes=291;293;296;299;44&gmt_diff=%2B2&dst=7,5,3;7,5,10&provider_id=0a89542c-5270-11e1-bf27-001d0947ec73&is_home=true&sms_points=1.0&sms_mult_points=1.0'

post "networks" 'id=793e7b47-b248-4c86-a26f-eadfc44f84e2&name=Life&country=Belarus&hex_code=&country_code=375&number_len=9&prefixes=251;252;253;254;255;256;257;258;259&gmt_diff=%2B2&dst=7,5,3;7,5,10&provider_id=0a89542c-5270-11e1-bf27-001d0947ec73&is_home=true&sms_points=2.0&sms_mult_points=1.0'

#
# Network maps
#
post "network_maps" 'id=c51a94bf-618a-48a4-90bf-7508e3d93b5d&name=Belarus&network_ids=0456837f-e874-4b05-8e89-95ae20b897d2;6dd0af45-7cdf-41aa-954b-cc368fe1968e;793e7b47-b248-4c86-a26f-eadfc44f84e2'

#
# Customers
#

#
# OneAPI

# postpaid customer
post "customers" 'customer_uuid=a3ddc34a-1793-11e2-9602-00269e42f7a5&customer_id=oneapi-postpaid&name=oneapi-postpaid&priority=1&rps=1000&network_map_id=c51a94bf-618a-48a4-90bf-7508e3d93b5d&receipts_allowed=true&default_validity=000003000000000R&max_validity=259200&default_provider_id=&pay_type=postpaid&credit=10000.0&credit_limit=10000.0&language=en&state=active'

# postpaid originators
post "customers/a3ddc34a-1793-11e2-9602-00269e42f7a5/originators" 'id=1&address=375296660003,1,1&description=&is_default=true&state=approved'

# postpaid users
post "customers/a3ddc34a-1793-11e2-9602-00269e42f7a5/users" 'id=user&password=password&connection_types=oneapi&mobile_phone=&first_name=&last_name=&company=&occupation=&email=&country=&language=en&state=active'


#
# Soap

# postpaid customer
post "customers" 'customer_uuid=c173786e-63ce-11e2-8740-001d0947ec73&customer_id=soap-postpaid&name=soap-postpaid&priority=1&rps=1000&network_map_id=c51a94bf-618a-48a4-90bf-7508e3d93b5d&receipts_allowed=true&default_validity=000003000000000R&max_validity=259200&default_provider_id=&pay_type=postpaid&credit=10000.0&credit_limit=10000.0&language=en&state=active'

# postpaid originators
post "customers/c173786e-63ce-11e2-8740-001d0947ec73/originators" 'id=1&address=999,6,0&description=&is_default=true&state=approved'

# postpaid users
post "customers/c173786e-63ce-11e2-8740-001d0947ec73/users" 'id=user&password=password&connection_types=soap&mobile_phone=&first_name=&last_name=&company=&occupation=&email=&country=&language=en&state=active'

#
# MM-client

# postpaid customer
post "customers" 'customer_uuid=8032706a-b4ec-11e3-b3d7-00269e42f7a5&customer_id=1&name=mm-postpaid&priority=1&rps=1000&network_map_id=c51a94bf-618a-48a4-90bf-7508e3d93b5d&receipts_allowed=true&default_validity=000003000000000R&max_validity=259200&default_provider_id=&pay_type=postpaid&credit=10000.0&credit_limit=10000.0&language=en&state=active'

# postpaid originators
post "customers/8032706a-b4ec-11e3-b3d7-00269e42f7a5/originators" 'id=1&address=375296660004,1,1&description=&is_default=true&state=approved'

# postpaid users
post "customers/8032706a-b4ec-11e3-b3d7-00269e42f7a5/users" "id=user&password=password&connection_types=mm&mobile_phone=&first_name=&last_name=&company=&occupation=&email=&country=&language=en&state=active"

#
# smppload

# postpaid customer
post "customers" 'customer_uuid=493b3678-9dc8-11e2-8cce-00269e42f7a5&customer_id=&name=smppload-postpaid&priority=1&rps=1000&network_map_id=c51a94bf-618a-48a4-90bf-7508e3d93b5d&receipts_allowed=true&default_validity=000003000000000R&max_validity=259200&default_provider_id=&pay_type=postpaid&credit=10000.0&credit_limit=10000.0&language=en&state=active'

# postpaid originators
post "customers/493b3678-9dc8-11e2-8cce-00269e42f7a5/originators" 'id=1&address=375296660002,1,1&description=&is_default=true&state=approved'
post "customers/493b3678-9dc8-11e2-8cce-00269e42f7a5/originators" 'id=2&address=375296660003,1,1&description=&is_default=false&state=approved'

# postpaid users
post "customers/493b3678-9dc8-11e2-8cce-00269e42f7a5/users" "id=user&password=password&connection_types=transmitter;receiver;transceiver&mobile_phone=&first_name=&last_name=&company=&occupation=&email=&country=&language=en&state=active"
post "customers/493b3678-9dc8-11e2-8cce-00269e42f7a5/users" "id=user2&password=password&connection_types=transmitter;receiver;transceiver&mobile_phone=&first_name=&last_name=&company=&occupation=&email=&country=&language=en&state=active"
post "customers/493b3678-9dc8-11e2-8cce-00269e42f7a5/users" "id=user3&password=password&connection_types=transmitter;receiver;transceiver&mobile_phone=&first_name=&last_name=&company=&occupation=&email=&country=&language=en&state=active"
post "customers/493b3678-9dc8-11e2-8cce-00269e42f7a5/users" "id=user4&password=password&connection_types=transmitter;receiver;transceiver&mobile_phone=&first_name=&last_name=&company=&occupation=&email=&country=&language=en&state=active"
post "customers/493b3678-9dc8-11e2-8cce-00269e42f7a5/users" "id=user5&password=password&connection_types=transmitter;receiver;transceiver&mobile_phone=&first_name=&last_name=&company=&occupation=&email=&country=&language=en&state=active"


#
# Addr2Cust
#

# oneapi postpaid customer
post "addr2cust" 'msisdn=375296660003,1,1&customer=a3ddc34a-1793-11e2-9602-00269e42f7a5&user=undefined'
# soap postpaid customer
post "addr2cust" 'msisdn=375296660005,1,1&customer=c173786e-63ce-11e2-8740-001d0947ec73&user=undefined'

exit 0