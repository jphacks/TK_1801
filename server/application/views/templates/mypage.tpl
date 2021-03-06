{include file="header.tpl" title="My Page" user=$user}
{ci_config name="base_url"}

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
  width: 125px;
  height: 125px;
  object-fit: cover;
  border-radius: 250px;
  border: solid 1px #FD5637;
}
.u-t12{
  font-size: 12px;
}
</style>

<!--put the main components of this page-->
<section class="u-pd-lr30">
  <!--Title-->
  <h2 class="u-pt50 text-center">My Page</h1>

  <!--User Informations-->
  <div class="media u-pt30">
  	<span class="media-left">
      <img class="p-user_icon" src="{$base_url}storage/profile_image/{$user['id']}">{* TODO: 真ん中に持ってきたい *}
  	</span>
  	<div class="media-body u-pl30">
      <!--Name-->
  		<h3>{$user['name']|escape}</h3>
      <ul>
        <li class="u-p130 u-t12">Point Balance: {$user['balance']} P</li>
        <li class="u-p130 u-t12">Location: {$user['location']}</li>
        <li class="u-p130 u-t12">
          Your Rating:
          {if empty($star_avg)}
            ☆☆☆☆☆ -
          {else}
            {if $star_avg < 2.0}
              ★☆☆☆☆
            {else if $star_avg < 3.0}
              ★★☆☆☆
            {else if $star_avg < 4.0}
              ★★★☆☆
            {else if $star_avg < 5.0}
              ★★★★☆
            {else}
              ★★★★★
            {/if}
            {round($star_avg, 1)}
          {/if}
        </li>
      </ul>
  	</div>
  </div>

  {*
  <!--
  History part
  できればスクロールするようにデザインしたい
  -->
  <div>
    {if $user['type'] == "guide"}
      <ul>
        {foreach $calls[''] as $call} <!--call the calls components from DB by user id-->
          <li>{$call}</li>
        {/foreach}
      </ul>
    {else}
      <ul>
        {foreach $customer_user['histories'] as $history}
          <li>{$history}</li>
        {/foreach}
      </ul>
    {/if}
  </div>
  *}

  <!--Button to change own information-->
  {if $user['type'] === 'guide'}
    <div class="u-pt30">
      <a href="/notifications"><button class="p-button-main" type="button" name="button">Your Reviews</button></a>
    </div>
  {/if}
  <div class="u-pt30">
    <button onclick="location.href='/setting'" class="p-button-main" type="button" name="button">Edit Profile</button>
  </div>
  <div class="u-pt30">
    <button onclick="location.href='/logout'" class="p-button-main" type="button" name="button">Logout</button>
  </div>
</section>

{include file="footer.tpl"}
