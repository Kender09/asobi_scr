# 遊びのプログラム集

## gacha.pm
slack bot のガチャ文言生成  
第一引数にサイズ 第二引数に成功数字列(or 利用する数字)  

## grep_ave.pm
log(nginxなどの)からgrepして特定フィールドの値の平均を返す  
利用方法としては、特定リクエストの平均レスポンス時間の集計  
引数にファイルパス(複数可)  

## search_hit_cashe.pm
Varnishのログから重複しているリクエストを調べる  
tailをパイプすればアクセスの多いURIが、wc使えば重複リクエスト数が取得できる  
引数にファイルパス(複数可)  

