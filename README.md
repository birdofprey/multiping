# multiping
multipingscription
0、基础软件安装：

0.1、redhat: yum install fping

0.2、Gnu/Linux: apt-get install fping

1、创建目录： mkdir ~/multiping

2、进入目录并vi multiping.sh,内容如下：

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
3、编辑节点列表，vi remotehosts.txt,内容如下：

www.baidu.com

www.163.com

www.linuxidc.com

www.linux.cn

www.oschina.net

www.google.com

www.facebook.com

4、

chmod + multiping.sh 

./multiping.sh

程序显示如下： [birdofprey@localhost ~/multiping]$ ./multiping.sh

5个节点正常！！！

2个节点异常：

www.google.com is unreachable

www.facebook.com is unreachable

测试等待。。。。。。

5个节点正常！！！

2个节点异常：

www.google.com is unreachable

www.facebook.com is unreachable

测试等待。。。。。。

Ctrl+c即可退出测试。。。。

说明：remotehosts.txt文件中可以加入用户需要测试的节点（IP或域名）,重复行会被自动删除
