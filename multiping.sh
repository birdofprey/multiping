#!/bin/bash
while true
do
    if [ $(awk 'a[$0]++' remotehosts.txt | wc -l) -gt 0 ];then
                awk '!a[$0]++' remotehosts.txt > remotehosts.txt.new && rm -f remotehosts.txt && mv remotehosts.txt.new remotehosts.txt
        fi
    fping -f remotehosts.txt 2>&1 | tee /tmp/multiping.log | grep "is alive" | echo "$(wc -l)个节点正常！！！"
        grep -v "is alive" /tmp/multiping.log | echo "$(wc -l)个节点异常：" && grep -v "is alive" /tmp/multiping.log
        rm -f /tmp/multiping.log > /dev/null 2>&1
    echo -e "$(date)\n" 
    echo -e "测试等待。。。。。。\n"
        sleep 15
done 
