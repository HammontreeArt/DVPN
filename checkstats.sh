#!/bin/bash

clear
rm /tmp/tmpstats.log
TMP=/tmp/tmpstats.log

rm /tmp/nodestats.log
LOG=/tmp/nodestats.log


echo "Querying Sentinel Nodes.  Please standy by..."

declare -A nodes
nodes[1074]="CryptoCraft"
nodes[1075]="CanadaCraft"
nodes[1076]="AussieCraft"
nodes[1077]="GeorgiPeach"
nodes[1123]="Bunch-Berry"
nodes[1142]="West--World"
nodes[1163]="CoyoteHills"
nodes[1185]="CherokeRose"
nodes[1174]="Blue-Bonnet"
nodes[1176]="Blue--Berry"

echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX NODE STATUS RESULTS XXXXXXXXXXXXXXXXXXXXXXXXXXXX" >> $LOG
sentinelcli query node  --home "${HOME}/.sentinelcli"  --node https://rpc.sentinel.co:443  sentnode1x9nerj8eqztsswz5k9vsa65f5345wqn0xal2ec >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo $node >> $LOG
true > $TMP
echo -ne '#####                                                                                          (  5%)\r'

sentinelcli query node  --home "${HOME}/.sentinelcli"  --node https://rpc.sentinel.co:443  sentnode1vvatdg5qfh0lnzv7gfaf9ep4dpver5zas8ssf2 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo $node >> $LOG
true > $TMP
echo -ne '##########                                                                                     ( 10%)\r'

sentinelcli query node  --home "${HOME}/.sentinelcli"  --node https://rpc.sentinel.co:443  sentnode1keskfeeana3n57kg7vs4glj5y8et8c0nq705v8 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo $node >> $LOG
true > $TMP
echo -ne '###############                                                                                ( 20%)\r'

sentinelcli query node  --home "${HOME}/.sentinelcli"  --node https://rpc.sentinel.co:443  sentnode1x6773xcxz77u73fx2arwqak72xr0ca23qhrhxq >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo $node >> $LOG
true > $TMP
echo -ne '####################                                                                           ( 25%)\r'

sentinelcli query node  --home "${HOME}/.sentinelcli"  --node https://rpc.sentinel.co:443  sentnode1grhesr30xkqwukus833g7qw5ewjf8ks8cn2gyp >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo $node >> $LOG
true > $TMP
echo -ne '#########################                                                                      ( 30%)\r'

sentinelcli query node  --home "${HOME}/.sentinelcli"  --node https://rpc.sentinel.co:443  sentnode1zex20cg8qzkydqntt8p6swehm23hugh5l23z57 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo $node >> $LOG
true > $TMP
echo -ne '##############################                                                                 ( 35%)\r'

sentinelcli query node  --home "${HOME}/.sentinelcli"  --node https://rpc.sentinel.co:443  sentnode1ckjq396mfrz50h0q3c9dt24z2mwrrg3zwf30z2 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo $node >> $LOG
true > $TMP
echo -ne '###################################                                                            ( 40%)\r'

sentinelcli query node  --home "${HOME}/.sentinelcli"  --node https://rpc.sentinel.co:443  sentnode13cd5ynwc497exnqs0c72g0g37ll50efezzcpm2 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo $node >> $LOG
true > $TMP
echo -ne '########################################                                                       ( 45%)\r'

sentinelcli query node  --home "${HOME}/.sentinelcli"  --node https://rpc.sentinel.co:443  sentnode1dvkj6m324669ax4v27gfhntwu8qr6ejh2gvj22 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo $node >> $LOG
true > $TMP
echo -ne '#############################################                                                  ( 50%)\r'

sentinelcli query node  --home "${HOME}/.sentinelcli"  --node https://rpc.sentinel.co:443  sentnode1nsudpdyx5wwjhwj68rt7khjn7l8gvsw2ee9mq5 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo $node >> $LOG
true > $TMP
echo -ne '##################################################                                             ( 55%)\r'





echo "" >> $LOG
echo "" >> $LOG
echo " XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX NODE QUOTA RESULTS XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" >> $LOG
echo "  MONIKER        NODE ADDRESS                                ALLOTTED     CONSUMED  " >> $LOG
echo "  --------       ----------------------------------------    --------     --------  " >> $LOG
sentinelcli query quotas --home "${HOME}/.sentinelcli" --node https://rpc.sentinel.co:443 --page 1 1074 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo "| "${nodes[1074]}" $node" >> $LOG
true > $TMP
echo -ne '#######################################################                                        ( 60%)\r'
sentinelcli query quotas --home "${HOME}/.sentinelcli" --node https://rpc.sentinel.co:443 --page 1 1075 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo  "| "${nodes[1075]}" $node" >> $LOG
true > $TMP
echo -ne '############################################################                                   ( 65%)\r'
sentinelcli query quotas --home "${HOME}/.sentinelcli" --node https://rpc.sentinel.co:443 --page 1 1076 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo  "| "${nodes[1076]}" $node" >> $LOG
true > $TMP
echo -ne '#################################################################                              ( 70%)\r'
sentinelcli query quotas --home "${HOME}/.sentinelcli" --node https://rpc.sentinel.co:443 --page 1 1077 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo  "| "${nodes[1077]}" $node" >> $LOG
true > $TMP
echo -ne '######################################################################                         ( 75%)\r'
sentinelcli query quotas --home "${HOME}/.sentinelcli" --node https://rpc.sentinel.co:443 --page 1 1123 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo  "| "${nodes[1123]}" $node" >> $LOG
true > $TMP
echo -ne '###########################################################################                    ( 80%)\r'
sentinelcli query quotas --home "${HOME}/.sentinelcli" --node https://rpc.sentinel.co:443 --page 1 1142 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo  "| "${nodes[1142]}" $node" >> $LOG
true > $TMP
echo -ne '################################################################################               ( 85%)\r'
sentinelcli query quotas --home "${HOME}/.sentinelcli" --node https://rpc.sentinel.co:443 --page 1 1163 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo  "| "${nodes[1163]}" $node" >> $LOG
true > $TMP
echo -ne '#####################################################################################          ( 90%)\r'
sentinelcli query quotas --home "${HOME}/.sentinelcli" --node https://rpc.sentinel.co:443 --page 1 1185 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo  "| "${nodes[1185]}" $node" >> $LOG
true > $TMP
echo -ne '##########################################################################################     ( 95%)\r'
sentinelcli query quotas --home "${HOME}/.sentinelcli" --node https://rpc.sentinel.co:443 --page 1 1174 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo  "| "${nodes[1174]}" $node" >> $LOG
true > $TMP
echo -ne '###############################################################################################(100%)\r'
sentinelcli query quotas --home "${HOME}/.sentinelcli" --node https://rpc.sentinel.co:443 --page 1 1176 >> $TMP
node=$(sed '/MONIKER\|+---\|ADDRESS/d' $TMP)
echo  "| "${nodes[1176]}" $node" >> $LOG
true > $TMP
echo -ne '##########################################################################################################)\r'


clear
echo ""
echo ""

n=1
input=$LOG
while IFS= read -r line;
do
        echo "$line"
        n=$((n+1))

done < "$input"
