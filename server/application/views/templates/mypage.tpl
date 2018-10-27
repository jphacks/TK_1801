{include file="header.tpl" title="My Page" user=$user}

<!--add the special style sheet of this page here!-->
<style media="screen">
  .u-pd-lr30{
    padding: 0 30px;
  }
  .u-pt10{
    padding-top: 10px;
  }
  .u-pt30{
    padding-top: 30px;
  }
  .u-pl30{
    padding-left: 30px;
  }
  .u-pt100{
    padding-top: 100px;
  }
  .u-pt50{
    padding-top: 50px;
  }
  .p-button-main{
    width: 100%;
    border-radius: 20px;
    line-height: 40px;
    background-color: #FF2525;
    color: #ffffff
  }
  .input-group-addon{

  }
  p,h1,h2,h3,h4{
    color: gray;
  }

  div.circle button.rateit-reset {
    display: none;
    width:50px;
    height:50px;
}
.p-user_icon{
  width: 150px;
  height: 150px;
  border-radius: 300px;
  border: solid 1px #FD5637;
}
</style>

<!--put the main components of this page-->
<section class="u-pd-lr30">
  <!--Title-->
  <h2 class="u-pt50 text-center">My Page</h1>
  <div class="media u-pt30">
  	<span class="media-body">
      <img class="p-user_icon" src="../images/user.jpg">
  	</span>
  	<div class="media-header u-pl30">
  		<h3 class="">{$user['name']|escape}</h3>
        <h4 class="u-p130">POINT:{$user['point']}</h4>
        <h4 class="u-p130">INFO :hogehogeo</h4>
  	</div>
  </div>

  <div class="row row-scrollable">
    {if $user['type'] == "guide"}
      <ul>
        {foreach $user['reviews'] as $review}
          <li>{$review}</li>
        {/foreach}
      </ul>
    {else}
      <ul>
        {foreach $user['histories'] as $history}
          <li>{$histories}</li>
        {/foreach}
      </ul>
    {/if}
  </div>

  <div class="u-pt30">
    <button class="p-button-main" type="button" name="button">Change Profiel</button>
  </div>
</section>

{include file="footer.tpl"}
