#!/bin/bash

#Author: 	S.Hammontree
#Date: 		2021-11-25
#
#
#-----------------------------------------------------------------------------------
clear
echo " "
echo "Querying Sentinel Nodes.  Please standy by..."
echo " "

declare -a moniker
moniker[0]="CryptoCraft 1074 |"
moniker[1]="CanadaCraft 1075 |"
moniker[2]="AussieCraft 1076 |"
moniker[3]="GeorgiPeach 1077 |"
moniker[4]="Bunch-Berry 1123 |"
moniker[5]="West--World 1142 |"
moniker[6]="CoyoteHills 1163 |"
moniker[7]="CherokeRose 1184 |"
moniker[8]="Blue-Bonnet 1174 |"
moniker[9]="Blue--Berry 1176 |"

declare -a nodes
nodes[0]="sentnode1x9nerj8eqztsswz5k9vsa65f5345wqn0xal2ec"
nodes[1]="sentnode1vvatdg5qfh0lnzv7gfaf9ep4dpver5zas8ssf2"
nodes[2]="sentnode1keskfeeana3n57kg7vs4glj5y8et8c0nq705v8"
nodes[3]="sentnode1x6773xcxz77u73fx2arwqak72xr0ca23qhrhxq"
nodes[4]="sentnode1grhesr30xkqwukus833g7qw5ewjf8ks8cn2gyp"
nodes[5]="sentnode1zex20cg8qzkydqntt8p6swehm23hugh5l23z57"
nodes[6]="sentnode1ckjq396mfrz50h0q3c9dt24z2mwrrg3zwf30z2"
nodes[7]="sentnode13cd5ynwc497exnqs0c72g0g37ll50efezzcpm2"
nodes[8]="sentnode1dvkj6m324669ax4v27gfhntwu8qr6ejh2gvj22"
nodes[9]="sentnode1nsudpdyx5wwjhwj68rt7khjn7l8gvsw2ee9mq5"

declare -a subs=("1074" "1075" "1076" "1077" "1123" "1142" "1163" "1185" "1174" "1176")

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
echo " XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX NODE QUOTA RESULTS XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" >> $log
echo " " >> $log
echo "  MONIKER      SUB  NODE ADDRESS                                      WALLET ADDRESS                                  ALLOTTED    CONSUMED   HANDSHAKE  NODE-STATUS  PEERS" >> $log
echo "  ----------- ----- -----------------------------------------------   -------------------------------------------   --------    --------   ---------  -----------  -----" >> $log
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

        shake="false"
        if [[ $node == *"true"* ]]; then
                shake="TRUE"
        fi

        status="${RED}INACTIVE"
        if [[ $node == *"STATUS_ACTIVE"* ]]; then
                status="ACVTIVE"
        fi

        peers=$(echo $node | cut -d "|" -f 9)

        sentinelcli query quotas --home "${HOME}/.sentinelcli" --node https://rpc.sentinel.co:443 --page 1 $i >> $tmp
        node=$(sed '/MONIKER\|+---\|ADDRESS/d' $tmp)

        echo "| "${moniker[$a]}" "${nodes[$a]}" $node   "$shake"    |  "$status"    "$peers  >> $log
        true > $tmp
		true > $nod
        a=$(expr $a + 1)
        echo -ne "  .... $a of 10 nodes .... \r"
done


clear   #SCREEN CLEAR
echo " " >> $log
echo " " >> $log


#XXXXXXXXX READ THE RESULTS AND DISPLY ON SCREEN XXXXXXXXXXXXXXXXXXXXXXXXXX
#--------------------------------------------------------------------------
n=1
input=$log
while IFS= read -r line;
do
        echo "$line"
        n=$((n+1))

done < "$input"
