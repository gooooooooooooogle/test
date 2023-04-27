import axios from 'axios';
import { default as PQueue } from 'p-queue';
const queue = new PQueue({ concurrency: 5 });
import fs from 'fs';

let urlList = [
  "https://22.lownet.xyz/api/v1/client/subscribe?token=357724b6fa0d4553f767a21f83888964",
  "https://sub.subconnect.org/api/v1/client/subscribe?token=4aed0a4efb711910ee86f5923856f972",
  "http://www.bf1p.top/api/v1/client/subscribe?token=0be347038aca10c576d6306ea1db4da9",
  "https://bigairport.rodeo/api/v1/client/subscribe?token=37db00416fb63635c9465ecd96de6ba9",
  "https://sub.speed17sub.com/api/v1/client/subscribe?token=033308acbb43724915af4efe7383b19a",
  "https://download-config.cdn-dao.xyz/link/uSWCBONapzS1NjS6?sub=3",
  "https://api.eejsq.org/api/v1/client/subscribe?token=f435918638a364ac67427eba4e5db9ca",
  "https://nainiujc.shop/api/v1/client/subscribe?token=b3ac711752bde1cee5c578eba33f462a",
  "https://subv5.nanoport.xyz/api/v1/client/subscribe?token=e41b5c561634abf0a017f72bcf184589",
  "https://www.chenxtyun.top/link/90gPuQfqg2Ez6zwl?sub=3",
  "https://lting.cyou/link/t16Wa7TcSwVDZgF5?clash=1",
  "https://api.flgwls.com/link/JC0ekPFMM9I7kuQM?trojan=1",
  "https://www.yiyuanjichang.net/api/v1/client/subscribe?token=bc3828f59f4542a9465dbe841a5a68df",
  "http://clash77.top/api/v1/client/subscribe?token=919287ab4d34d652ab2ece4842464642",
  "https://sidog.top/api/v1/client/subscribe?token=9c5d0deda9a6dcfbde47b0cd59f68117",
  "https://rsslinghun1.xyz/api/v1/client/subscribe?token=29d15db35a68b69c2dcdda5c87d8d4e6",
  "https://vvtestatiantian.top/api/v1/client/subscribe?token=e09bfa74660243abd8f9c222882a1d4c",
  "https://sanfen002.xyz/api/v1/client/subscribe?token=c92bcc92e2bab74ca6c64f31bb2ffc11",
  "https://sub.subconnect.org/api/v1/client/subscribe?token=f4ea26d5cf6770ea9011faf26e01527b",
  "https://zero.76898102.xyz/link/cz1zFdZ2j486JmwX?clash=1",
  "https://sub.cfjc.sbs/api/v1/client/subscribe?token=5946f473c5b1004a54be6f1b8f0fdf0f",
  "https://s1.bnpublicsub.com/api/v1/client/subscribe?token=672d1d24e129bb81157f470d3de83cca",
  "https://www.xiaohouzi.store/link/hI3eiQpyAaWFMzK6?clash=1",
  "https://github-config.99sub.work/link/1SU4mssZpGsY9KFW?sub=3",
  "https://subapi1.gardenparty.one/link/4SDQqrTM1YDXPmD5?sub=3",
  "https://dy.nnnn2.xyz/api/v1/client/subscribe?token=5004043c01744cf80779d3660c85d633&amp;flag=v2ray",
  "https://xn--30rs3bu7r87f.com/api/v1/client/subscribe?token=486efe46a7296a5c4f3da8bb84765c5d",
  "https://sockboom.me/link/n0aVAChkMeqpXRcg?mu=1",
  "https://nutcloud.me/link/ec80e77dd8783f67?clash=1",
  "https://shipv.net/link/Sp5ZHVgDp1qiroOH?sub=3",
  "https://mcwy.xyz/api/v1/client/subscribe?token=cf126e331e84ef7e0124c6f4093a0372",
  "https://ooicat.uk/link/t119XWhcdhCqzKXK?clash=1",
  "https://free.gcup.wiki/api/v1/client/subscribe?token=99b91f4738bc9f9921741b374a788b71",
  "https://mcwy.xyz/api/v1/client/subscribe?token=c410391e3b7f04bf7892e383dc81d20e",
  "https://jjyunshop.ml/api/v1/client/subscribe?token=7c451b44a8cc490e082d5eeff46ec438",
  "https://sub.bkcloud.quest/api/v1/client/subscribe?token=68f21a2334a8b73b0bed007b92bfdcc4",
  "https://zero.marisalnc.com/link/qdHIr54l7ygYPiNG?clash=1",
  "https://adobe.zhuzhu12.com/link/rbPHm87z7HiuVw68?sub=3&amp;extend=1",
  "https://wkyun1688.com/api/v1/client/subscribe?token=4528a528fce013ae9f0c6e32e4983b9b",
  "https://mojie.best/api/v1/client/subscribe?token=7b6ed1c61010e0e4098bf598f9deab9b",
  "https://service-o886map6-1259649824.gz.apigw.tencentcs.com/link/kKzzKz34LRbw3uBH?clash=1",
  "https://vpn.nrowibu.site/api/v1/client/subscribe?token=1932a20b373956f6e62331b3b9037376",
  "https://www.efcloud.cc/api/v1/client/subscribe?token=b02ac17ef2e59beb8e7f5fc9b4ac52e3",
  "https://pa.moodrfd1.best/api/v1/client/subscribe?token=90bdd425b8d0c77c84180e68f7eb0953",
  "https://vpn.nrowibu.site/api/v1/client/subscribe?token=76089d8a7eca726accf9556931b1cbe6",
  "https://mrli.mobi/link/ilP2VMgXlPuvj3w3?clash=1",
  "https://dy.v-too.cloud/api/v1/client/subscribe?token=75042d7f258d4255401171eef51e0680",
  "https://s.juzicloud.vip/link/KdZnAnugsvNEvCPp?sub=3",
  "https://sub.subconnect.org/api/v1/client/subscribe?token=a5ffce5763a61ff498f541ca9f60c520",
  "https://ysbzc.subscribe6.com/api/v1/client/subscribe?token=d23d60a76693fb43d7bd70a3f1a2cd3a",
  "https://api.prprcloud.life/ss/111964/R0ozhPt3o3/",
  "https://getnode.dksb.store/subscribe/202020/LzBOf5QP5psB",
  "https://apiv2.pptiok2020.com/apiv2/vjgb7lsudev7yhch?clash=2&amp;extend=1",
  "https://srftbg.sendmailt.com/heartbeat/ZL4uxwdxy5eztfoZ07c4dgDfRQ/Ny2ZbYesjgydsSNQ?clash=1",
  "http://yun.happyfree.top/api/v1/client/subscribe?token=b3e7cb0529f1b704a965cf1193d92363",
  "https://www.yiyuanjichang.net/api/v1/client/subscribe?token=74a5e36bb48c85db8a5f1ea68e64fee2",
  "http://sub.966888.xyz/api/v1/client/subscribe?token=532509669d30a9766c7d7f462e3016ae",
  "https://www.legeth.com/api/v1/client/subscribe?token=a46371af818441a5cd6add1d354d5138",
  "https://subscribe.interface.kuailian.org/api/v1/client/subscribe?token=76ba9cbe5180b3932803ef1b26e46acb"
];

let clash_list = [];
let v2_list = [];
let airport_list = [];

async function sub_check(url) {
  try {

    const res = await axios({
      method: 'get',
      url: url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'User-Agent': 'ClashforWindows/0.18.1'
      },
      proxy: {
        host: '192.168.2.123',
        port: '7890',
      },
      timeout: 5000
    });

    if (res.status === 200) {
      try {
        const info = res.headers['subscription-userinfo'];
        const infoNum = info.match(/\d+/g);
        if (infoNum) {
          // 单位为GB
          let upload = infoNum[0] / 1024 / 1024 / 1024;
          let download = infoNum[1] / 1024 / 1024 / 1024;
          download = download.toFixed(2);
          let total = infoNum[2] / 1024 / 1024 / 1024;
          total = total.toFixed(2);
          let unused = total - upload - download;
          unused = unused.toFixed(2);

          if (unused > 0) {
            airport_list.push("可用流量：" + unused + "GB  " + url);
          }
        }
      } catch (error) {
        try {
          if (res.data.includes('proxies:')) {
            clash_list.push(url);
          }
        } catch (error) {
          try {
            let text = res.data.slice(0, 64);
            text = Buffer.from(text, 'base64').toString();
            if (filter_base64(text)) {
              v2_list.push(url);
            }
          } catch (error) { }
        }
      }
    }
  } catch (error) {

  }
}

async function run() {
  for (const url of urlList) {
    await queue.add(() => sub_check(url));
  }

  console.log('clash_list:', clash_list);
  console.log('v2_list:', v2_list);
  console.log('airport_list:', airport_list);

  let info = '';

  for (const item of airport_list) {
    info += item + '\r\n';
  }

  fs.writeFile('可用VPN订阅.txt', info, function (err) {
    if (err) throw err;
    console.log('文件已写入');
  });
}

run();