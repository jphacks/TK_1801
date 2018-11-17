<?php

// 設定

$LOG_FILE = dirname(__FILE__).'/hook.log';

$SECRET_KEY = 'ki9ch14ne';

$header = getallheaders();

$hmac = hash_hmac('sha1', file_get_contents("php://input"), $SECRET_KEY);

if ( isset($header['X-Hub-Signature']) && $header['X-Hub-Signature'] === 'sha1='.$hmac ) {

    echo "master\n";
    unset($output);
    exec('git checkout master', $output);
    exec('git pull origin master', $output);
    exec('git status', $output);
    exec('git log -1', $output);
    echo implode("\n", $output)."\n\n";
    echo "\n";
    echo 'OK';

} else {

    // 認証失敗

    header('HTTP', true, 401);

    file_put_contents($LOG_FILE, date("[Y-m-d H:i:s]")." invalid access: ".$_SERVER['REMOTE_ADDR']."\n", FILE_APPEND|LOCK_EX);

    echo 'NG';

}