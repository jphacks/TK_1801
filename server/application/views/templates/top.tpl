<!DOCTYPE html>
<html lang="ja">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<meta name="apple-mobile-web-app-title" content="LeadMe">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>{if isset($title)}{$title} - {/if}LeadMe</title>

<!-- Bootstrap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/js/vegas/vegas.min.css" rel="stylesheet" type="text/css" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<style>
.LeadMe{
  text-align: center;
  padding-top: 100px;
}
.head__logo{
  width: 10%;
  height: auto;
}
.catch{
    text-align: center;
    font-family: Arial-Black;
    padding-top: 20px;
    position: relative;
    left: 50%;
    transform-box: trans;
    transform: translateX(-50%);
}
.u-t35{
    font-size:35px;
    color: white;
}
.u-pt10{
  padding-top: 10px;
}
.p-button-modal__open{
    border-radius: 3px;
    height: 40px;
    border: none;
    padding: 4px 15px;
    background: linear-gradient(60deg,#eb1c1c,#f15a5a);
    color: #ffffff;
    text-align: center;
    width: 75%;
    margin: 40px auto 0 auto;
    display: table;
    font-size: 15px;
    border-radius: 20px
}
.body{
  margin: 0 !important;
}
.center{
    text-align:center;
}
.l-sectionLayout_lp{
  /* background-image: url(/images/lp.jpg); */
  background-size: cover;
  background-position: bottom 0 right -500px;
  height: 100%;
}
.bg-mask {
  height: 100%;
  /* background: rgba(255,255,255,0.5); */
  background-color: rgba(0,0,0,0.5);
}
.u-color-white{
  color: white;
}
.u-style_oblique{
  font-style:oblique;
}
.text_big{
  font-weight: bold;
  font-size: 60px;
}
button{
  cursor: pointer;
}
a{
  cursor: pointer;
}
.l-sectionLayout_lp{
  height: 1200px;
  width: 100%;
}
@media screen and (max-width: 768px){
  .l-sectionLayout_lp{
    height: 900px;
    width: 100%;
  }
  .head__logo{
    width: 30%;
    height: auto;
  }
}

.u-pt30{
  padding-top: 30px;
}
.l-align-left{
  text-align: left;
}
</style>

<section class="l-sectionLayout_lp">
  <div class="bg-mask">
    <div class="LeadMe">
      <span><img src="/images/logo_lead_me.png"  class="head__logo"></span>
    </div>
    <div class="catch">
        <p class="u-pt50 u-t35"><span class="text_big">F</span>ind a guide,</p>
        <p class=" u-t35"><span class="text_big">F</span>un your tourism</p>
        <p class="u-color-white u-style_oblique u-pt10">観光客とガイドを繋ぐプラットフォーム</p>
    </div>
    <div class="button u-pt30">
        <a href="/register"><button  id="signup-as-subscriber" class="p-button-modal__open">今すぐ始める</button></a>
        <p class="center u-pt30 u-color-white">または</p>
        <a href="/login"><button id="signup-as-subscriber" class="p-button-modal__open">ログイン</button></a>
    </div>
    <!-- <div class="center">※Youtubeチャンネルが必要です</div> -->
  </div>
</section>
<script src="/js/vegas/vegas.min.js"></script>
<script type="text/javascript">
  $(function() {
    $("#example,  .l-sectionLayout_lp ").vegas({
        slides: [
            { src: "/images/58.jpg" },
            { src: "/images/lp.jpg" },
        ],
        transition: 'fade',
        animation: [ 'kenburnsUp', 'kenburnsDown', 'kenburnsLeft', 'kenburnsRight' ],
        transitionDuration: 2000
    });
  });
</script>
