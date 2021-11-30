#!/bin/bash

#Author: 	S.Hammontree
#Date: 		2021-11-25
#
#-----------------------------------------------------------------------------------

clear
echo " "
echo "Querying Sentinel Nodes.  Please standy by..."
echo " "

declare -a nodes
nodes[0]="sentnode1x9nerj8eqztsswz5k9vsa65f5345wqn0xal2ec"
nodes[1]="sentnode1vvatdg5qfh0lnzv7gfaf9ep4dpver5zas8ssf2"
nodes[2]="sentnode1x6773xcxz77u73fx2arwqak72xr0ca23qhrhxq"
nodes[3]="sentnode1grhesr30xkqwukus833g7qw5ewjf8ks8cn2gyp"
nodes[4]="sentnode1keskfeeana3n57kg7vs4glj5y8et8c0nq705v8"
nodes[5]="sentnode1ckjq396mfrz50h0q3c9dt24z2mwrrg3zwf30z2"
nodes[6]="sentnode13cd5ynwc497exnqs0c72g0g37ll50efezzcpm2"
nodes[7]="sentnode1dvkj6m324669ax4v27gfhntwu8qr6ejh2gvj22"
nodes[8]="sentnode1nsudpdyx5wwjhwj68rt7khjn7l8gvsw2ee9mq5"
nodes[9]="sentnode1zex20cg8qzkydqntt8p6swehm23hugh5l23z57"

declare -a subs=("1074" "1075" "1076" "1077" "1123" "1142" "1163" "1174" "1176" "1185")

declare -a wallet
wallet[0]="sent1x9nerj8eqztsswz5k9vsa65f5345wqn0st7nuw"
wallet[1]="sent1vvatdg5qfh0lnzv7gfaf9ep4dpver5zax33fvu"
wallet[2]="sent1x6773xcxz77u73fx2arwqak72xr0ca23kpzwrk"
wallet[3]="sent1grhesr30xkqwukus833g7qw5ewjf8ks8w9t3ph"
wallet[4]="sent1keskfeeana3n57kg7vs4glj5y8et8c0nkgwdf3"
wallet[5]="sent1zex20cg8qzkydqntt8p6swehm23hugh5fusm3g"
wallet[6]="sent1ckjq396mfrz50h0q3c9dt24z2mwrrg3zclsk8u"
wallet[7]="sent1dvkj6m324669ax4v27gfhntwu8qr6ejhu7dt0u"
wallet[8]="sent1nsudpdyx5wwjhwj68rt7khjn7l8gvsw200yz9z"
wallet[9]="sent13cd5ynwc497exnqs0c72g0g37ll50efe55ec7u"


#ASSIGN local variables
log=/tmp/results.log
tmp=/tmp/tmp.log
nod=/tmp/nod.log

#CLEAR temp table
if [ -f "$tmp" ]
then
        rm /tmp/tmp.log
fi

#CLEAR results log table
if [ -f "$log" ]
then
        rm /tmp/results.log
fi

#CLEAR results Node Temp table
if [ -f "$nod" ]
then
        rm /tmp/nod.log
fi


echo "" >> $log
echo "" >> $log
echo " XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX NODE QUOTA RESULTS XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" >> $log
echo " " >> $log
echo "  MONIKER   SUB  NODE ADDRESS                                      WALLET ADDRESS                                ALLOCATED    CONSUMED   HANDSHAKE    NODE-STATUS    PEERS" >> $log
echo "  -------- ----- -----------------------------------------------   -------------------------------------------   ---------    --------   ---------    -----------    -----" >> $log
echo "@@@ BEGIN QUERY NODE QUOTA... "
echo " "
echo " "


a=0
for i in "${subs[@]}"
do

        #CHECK NODE HANDSHAKE AND STATUS
        #-----------------------------------------------------------------------------------------------------------
        sentinelcli query node --home "${HOME}/.sentinelcli" --node https://rpc.sentinel.co:443 ${nodes[$a]} >> $nod
        node=$(sed '/MONIKER\|+---\|ADDRESS/d' $nod)

        moniker=$(echo $node | cut -d "|" -f 2)
        moniker=${moniker:1:9}

        shake=$(echo $node | cut -d "|" -f 10)
        shake=$(echo $shake | sed 's/ *$//g')

        status=$(echo $node | cut -d "|" -f 12)
        status=$(echo $status | sed 's/ *$//g')

        peers=$(echo $node | cut -d "|" -f 9)
        peers=$(echo $peers | sed 's/ *$//g')


        #CHECK NODE QUOTAS
        #-----------------------------------------------------------------------------------------------------------
        sentinelcli query quotas --home "${HOME}/.sentinelcli" --node https://rpc.sentinel.co:443 --page 1 $i >> $tmp
        node=$(sed '/MONIKER\|+---\|ADDRESS/d' $tmp)

        allocated=$(echo $node | cut -d "|" -f 3)
        allocated=$(echo $allocated | sed 's/ *$//g')

        consumed=$(echo $node | cut -d "|" -f 4)
        consumed=$(echo $consumed | sed 's/ *$//g')

        #WRITE TO LOG
        #----------------------------------------------------------------------------------------------------------------------------------
        echo "| "$moniker" "$i" "${nodes[$a]}" | "${wallet[$a]}" | "$allocated"    |   "$consumed"    | "$shake"    |  "$status"    "$peers >> $log


        #CLEAR LOOP VARS
        #--------------------------------------
        true > $tmp
        true > $nod
        a=$(expr $a + 1)
        echo -ne "  .... $a of 10 nodes .... \r"
        mon=""
        moniker=""
        shake=""
        status=""
        peers=""

done


clear   #SCREEN CLEAR
echo " " >> $log
echo "===========================================================================================================================================================================" >> $log
echo "Report Run Date: "$(date +%Y-%m-%d) " / Time: " $(date +%T) >> $log

#XXXXXXXXX READ THE RESULTS AND DISPLY ON SCREEN XXXXXXXXXXXXXXXXXXXXXXXXXX
#--------------------------------------------------------------------------
n=1
input=$log
while IFS= read -r line;
do
        echo "$line"
        n=$((n+1))

done < "$input"
true > $log
